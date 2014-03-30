---
layout: index
title: PC的程序员记录
description: 记载技术,生活相关文字. 目前主要关注在Android, Ruby等方面.
group: index
date: 2011-02-01
---

{% include JB/setup %}

<h2>{{ site.lang.cn.last_5_p }}</h2>
<ul class="posts">
  {% assign size = 0 %}
  {% for post in site.posts %}
    {% if post.category contains 'it/technical' %}
        {% if size <= 12 %}
            {% assign size = size | plus:1 %}
            <li><span>{{ post.date | date: "%Y-%m-%d" }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
        {% endif %}
    {% endif %}
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
    <li><a href="http://may511.lofter.com/" target='_black'>May511Blog</a></li>
</ul>
