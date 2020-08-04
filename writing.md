---
layout: list
class: writing
---

## Writing

I enjoy sharing longer form things online, but I've only done so incredibly
sporadically over the years. I keep promising myself I'll write more, and I
remain hopeful that one day I'll be able to figure out a practice that gets me
doing so regularly.

<ul>
  {% assign listed_posts = site.posts | where: "listed", "true" %}
  {%- for post in listed_posts -%}
  <li>
    <em>{{ post.date | date: "%Y-%m-%d" }}</em>
    <a href="{{ post.url | relative_url }}">
      {{ post.title | escape }}
    </a>
  </li>
  {%- endfor -%}
</ul>
