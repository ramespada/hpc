---
layout: page
title: Computación de Alta Performance 
nositetitle: true
---

El objetivo de este curso es exponer las bases para el desarrollo de aplicaciones de alta performance, con enfasis en los aspectos prácticos de su programación e implementación.

El curso no asume conocimientos previos de programación, por lo que la primer parte está centrada en el uso de linea de comando (*shell*), la sintaxis de los lenguajes más utilizados en esta disciplina (`C` y `Fortran`), asi también como herramientas para compilar, desarrollar, debuggear y profilar programas.

La parte central del curso consiste en la implementación de programas (en C y/o Fortran) que hagan uso de la paralelización en distintas arquitecturas, a saber: de memoria compartida (`openMP`), de memoria distribuida (`MPI`) y aceleradores ó GPUs (`CUDA`, `openACC` y `openCL`). El espiritú siempre va a estar en analizar el incremento en la performance (*speedup*) con sus equivalentes programas seriales ó secuenciales, y en el analisis de la escalabilidad de cada herramienta.

Acá podés encontrár [más información sobre este curso](/info/).


# Clases  

{% comment %}
**Lecture**: 35-225, 2pm--3pm<br>
**Office hours**: 32-G9 lounge, 3pm--4pm (every day, right after clase)
{% endcomment %}

<ul>
{% assign clases = site['2023'] | sort: 'date' %}
{% for clase in clases %}
    {% if clase.phony != true %}
        {% if clase.ready %}
        <li>
        <strong>{{ clase.date | date: '%d %b' }}</strong>:
            <a href="{{ clase.url }}">{{ clase.title }}</a>
        </li>
        {% else %}
        {% comment %}
		 <li>  {{ clase.title }} {% if clase.noclass %}[no class]{% endif %}</li> 
        {%endcomment%}
        {% endif %}
    {% endif %}
{% endfor %}
</ul>

Los videos tutoriales están disponible [en Youtube](https://www.youtube.com/@ramiroespadaguerrero/playlists).


---

<div class="small center">
<p><a href="https://github.com/ramespada/hpc">Source code</a>.</p>
<p>Licncia MIT</p>
<p>See <a href="/license/">here</a> for contribution &amp; translation guidelines.</p>
</div>
