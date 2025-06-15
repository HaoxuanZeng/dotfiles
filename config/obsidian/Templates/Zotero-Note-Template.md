---
年份: {{date | format ("YYYY")}}
标签: 
作者: {{authors}}

摘要:  {{abstractNote}}
---

# {{title}}

> [!info]- Metadata – {% for attachment in attachments | filterby("path", "endswith", ".pdf") %}[PDF{% if not loop.first %} {{loop.index}}{% endif %}]({{attachment.desktopURI|replace("/select/", "/open-pdf/")}}){% if not loop.last %}, {% endif %}{% endfor %}
>- **Title**:: {{title}}  
>- **Authors**:: {%- for creator in creators %} {%- if creator.name == null %} {{creator.firstName}} {{creator.lastName}}, {%- endif -%} {%- if creator.name %}**{{creator.creatorType | capitalize}}**:: {{creator.name}}{%- endif -%}{%- endfor %}.
>- **Year**:: {{date | format("YYYY")}}   
>- **Citekey**:: {{citekey}} {%- if itemType %}  
>- **itemType**:: {{itemType}}{%- endif %}{%- if itemType == "journalArticle" %}  
>- **Journal**:: *{{publicationTitle}}* {%- endif %}{%- if volume %}  
>- **Volume**:: {{volume}} {%- endif %}{%- if issue %}  
>- **Issue**:: {{issue}} {%- endif %}{%- if itemType == "bookSection" %}  
>- **Book**:: {{publicationTitle}} {%- endif %}{%- if publisher %}  
>- **Publisher**:: {{publisher}} {%- endif %}{%- if place %}  
>- **Location**:: {{place}} {%- endif %}{%- if pages %}   
>- **Pages**:: {{pages}} {%- endif %}{%- if DOI %}  
>- **DOI**:: {{DOI}} {%- endif %}{%- if ISBN %}  
>- **ISBN**:: {{ISBN}} {%- endif %}    
>***
>- **Keywords**:: {% if allTags %} {{allTags}} {% endif %}
>- **Bibliography:**: {%- if bibliography %} {{bibliography|replace("\n"," ")}} {%- endif %}
>- **Related**:: {% for relation in relations -%} {%- if relation.title -%} [[{{relation.title}}]], {% endif -%} {%- endfor%}

> [!ABSTRACT]- ABSTRACT
> {% if abstractNote %} 
> {{abstractNote|replace("\n"," ")}}
> {% endif %}

# 笔记
{% for annotation in annotations -%}
{%- if annotation.annotatedText -%}{% if 'Red' in annotation.colorCategory %}**{{annotation.annotatedText | escape }}**{% else %}

<mark class="customZot-{% if annotation.color %}{{annotation.colorCategory}} {% endif %}">{{annotation.annotatedText | escape }}</mark> ([第{{annotation.page}}页](zotero://open-pdf/library/items/{{annotation.attachment.itemKey}}?page={{annotation.page}}&annotation={{annotation.id}}))
{% endif %}{%- endif %} {% if annotation.imageRelativePath %} ![[{{annotation.imageRelativePath}}]]{% endif %}{% if annotation.comment %} 
> {{annotation.comment}}
{% endif %}{% endfor -%}


