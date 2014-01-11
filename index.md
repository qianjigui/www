---
layout: index
title: index
group: index
---

{% include JB/setup %}

<h2>{{ site.lang.cn.last_5_p }}</h2>
<ul class="posts">
  {% for post in site.posts limit:5 %}
    <li><span>{{ post.date | date: "%Y-%m-%d" }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

<h2>{{ site.lang.cn.star_post }}</h2>
<ul class="posts">
{% for tag in site.tags %}
    {% if tag[0] == 'Review' %}
        {% assign pages_list = tag[1] %}
        {% include JB/pages_list %}
    {% endif %}
{% endfor %}
</ul>
