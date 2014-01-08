---
layout: page
title: PC 程序员记忆 index
group: index
---

{% include JB/setup %}

<h2>{{ site.lang.cn.all_pages }}</h2>
<ul>
{% assign pages_list = site.pages %}
{% include JB/pages_list %}
</ul>

<h2>{{ site.lang.cn.last_5_p }}</h2>
<ul class="posts">
  {% for post in site.posts limit:5 %}
    <li><span>{{ post.date | date: "%Y-%m-%d" }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

