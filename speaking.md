---
layout: list
class: speaking
---

## Speaking

I've gotten the chance to give a handful of conference talks a year for the
majority of my career. I find the process of putting together and delivering
talks to be quite challenging but quite rewarding. Writing a talk forces me to
clarify my understanding of a given topic, and delivering it helps me connect
with others by sharing that understanding.

:construction: _(( under construction dot gif ))_ :construction:

The below list is just an initial pass at gathering together a few slides and videos. More to come!

<ul>
  {%- for talk in site.talks -%}
  <li>
    <em>{{ talk.date | date: "%Y-%m-%d" }}</em>
    <a href="{{ talk.url | relative_url }}">
      {{ talk.title | escape }}
    </a>
  </li>
  {%- endfor -%}
</ul>

