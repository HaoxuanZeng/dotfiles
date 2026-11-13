local value_width = 28

local function characters(s)
    return s:gmatch('[%z\1-\127\194-\244][\128-\191]*')
end

local function char_width(character)
    local a, b, c, d = character:byte(1, 4)
    if d then
        c = (a - 0xF0) * 0x40000 + (b - 0x80) * 0x1000 + (c - 0x80) * 0x40 + d - 0x80
    elseif c then
        c = (a - 0xE0) * 0x1000 + (b - 0x80) * 0x40 + c - 0x80
    elseif b then
        c = (a - 0xC0) * 0x40 + b - 0x80
    else
        c = a
    end
    if c < 32 or (c >= 0x7F and c < 0xA0)
        or (c >= 0x300 and c <= 0x36F)
        or (c >= 0x1AB0 and c <= 0x1AFF)
        or (c >= 0x1DC0 and c <= 0x1DFF)
        or (c >= 0x200B and c <= 0x200F)
        or (c >= 0x202A and c <= 0x202E)
        or (c >= 0x2060 and c <= 0x206F)
        or (c >= 0x20D0 and c <= 0x20FF)
        or (c >= 0xFE00 and c <= 0xFE0F)
        or (c >= 0xFE20 and c <= 0xFE2F)
        or (c >= 0xE0100 and c <= 0xE01EF) then
        return 0
    end
    if (c >= 0x1100 and c <= 0x115F)
        or c == 0x2329 or c == 0x232A
        or (c >= 0x2600 and c <= 0x27BF)
        or (c >= 0x2E80 and c <= 0xA4CF)
        or (c >= 0xAC00 and c <= 0xD7A3)
        or (c >= 0xF900 and c <= 0xFAFF)
        or (c >= 0xFE10 and c <= 0xFE19)
        or (c >= 0xFE30 and c <= 0xFE6F)
        or (c >= 0xFF01 and c <= 0xFF60)
        or (c >= 0xFFE0 and c <= 0xFFE6)
        or (c >= 0x1F000 and c <= 0x1FAFF)
        or (c >= 0x20000 and c <= 0x3FFFD) then
        return 2
    end
    return 1
end

local function text_width(s)
    local width = 0
    for character in characters(s) do
        width = width + char_width(character)
    end
    return width
end

function ff_fit(value, limit)
    local s = tostring(value or ''):gsub('\27%[[%d;:]*m', ''):gsub('[%z\1-\31\127]', ' ')
    limit = limit or value_width
    if text_width(s) <= limit then
        return s
    end
    if limit < 1 then
        return ''
    end
    local result, width = {}, 0
    for character in characters(s) do
        local next_width = width + char_width(character)
        if next_width > limit - 1 then
            break
        end
        result[#result + 1] = character
        width = next_width
    end
    return table.concat(result):gsub('%s+$', '') .. '…'
end

function ff_pair(name, suffix)
    suffix = ff_fit(suffix or '', value_width - 4)
    return ff_fit(name, value_width - text_width(suffix)) .. suffix
end

function ff_border(top)
    return '   ' .. (top and '╭' or '╰') .. string.rep('─', value_width + 15) .. (top and '╮' or '╯')
end

function ff_host(a)
    local name = a.name:gsub('%((%d+)%-inch,%s*(%d%d%d%d).-%)', '%1″ (%2)')
    return ff_fit(name)
end

local function hardware_name(name)
    return name:gsub('^%d+%a+ Gen%s+', '')
        :gsub('%(R%)', ''):gsub('%(TM%)', ''):gsub('®', ''):gsub('™', '')
        :gsub('%s+CPU%s*@.*$', ''):gsub('%s+%d+%-Core Processor$', '')
        :gsub('%s+Processor$', ''):gsub('%s+', ' '):match('^%s*(.-)%s*$')
end

local function compact_name(name, suffix)
    name = hardware_name(name)
    if text_width(name .. suffix) > value_width then
        name = name:gsub('^Intel%s+', ''):gsub('^Core%s+', '')
            :gsub('^NVIDIA%s+GeForce%s+', ''):gsub('^NVIDIA%s+', '')
            :gsub('^AMD%s+', ''):gsub('^Ryzen%s+%d+%s+', 'Ryzen ')
    end
    return ff_pair(name, suffix)
end

function ff_cpu(a)
    local cores = tonumber(a.coresPhysical) or 0
    local suffix = cores > 0 and string.format(' (%dC)', cores) or ''
    local frequency = a.freqMax ~= '' and a.freqMax or a.freqBase
    if frequency and frequency ~= '' then
        suffix = suffix .. ' @ ' .. frequency
    end
    return compact_name(a.name, suffix)
end

function ff_gpu(a)
    local cores = tonumber(a.coreCount) or 0
    local suffix = cores > 0 and string.format(' (%dC)', cores) or ''
    if a.platformApi and a.platformApi ~= '' then
        suffix = suffix .. ' @ ' .. a.platformApi
    end
    return compact_name(a.name, suffix)
end
