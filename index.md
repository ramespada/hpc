---
layout: page
title: Computación de Alta Performance 
nositetitle: true
---

El objetivo de este curso es exponer las bases para el desarrollo de aplicaciones
de alta performance focalizano en los aspectos prácticos de la programación de estas. 

El curso asume nulos conocimientos previos de programación, por lo que la primer parte
está centrada en el uso de linea de comando (Shell), sintaxis de los lenguajes más utilizados en esta disciplina (C y Fortran), asi también como herramientas para compilar, debuggear, profilar programas.
De todas foras el foco del curso está en la programación utilizando librerias tales como openMP, MPI, CUDA, Coarrays, entre otros.

Acá podés encontrár [qué motivó armar este curso](/about/).


# Clases  

{% comment %}
**Lecture**: 35-225, 2pm--3pm<br>
**Office hours**: 32-G9 lounge, 3pm--4pm (every day, right after lecture)
{% endcomment %}

<ul>
{% assign lectures = site['2023'] | sort: 'date' %}
{% for lecture in lectures %}
    {% if lecture.phony != true %}
        <li>
        <strong>{{ lecture.date | date: '%d/%m/%y' }}</strong>:
        {% if lecture.ready %}
            <a href="{{ lecture.url }}">{{ lecture.title }}</a>
        {% else %}
            {{ lecture.title }} {% if lecture.noclass %}[no class]{% endif %}
        {% endif %}
        </li>
    {% endif %}
{% endfor %}
</ul>

Video recordings of the lectures are available [on
YouTube](https://www.youtube.com/playlist?list=PLyzOVJj3bHQuloKGG59rS43e29ro7I57J).

{% comment %}
# Sobre el curso

**Staff**: This class is co-taught by [Anish](https://www.anishathalye.com/), [Jon](https://thesquareplanet.com/), and [Jose](http://josejg.com/).<br>
**Questions**: Email us at [missing-semester@mit.edu](mailto:missing-semester@mit.edu).

## Agradecimientos

We thank Elaine Mello, Jim Cain, and [MIT Open
Learning](https://openlearning.mit.edu/) for making it possible for us to
record lecture videos; Anthony Zolnik and [MIT
AeroAstro](https://aeroastro.mit.edu/) for A/V equipment; and Brandi Adams and
[MIT EECS](https://www.eecs.mit.edu/) for supporting this class.
{% endcomment %}

---

<div class="small center">
<p><a href="https://github.com/ramespada/hpc">Source code</a>.</p>
<p>Licensed under CC.</p>
<p>See <a href="/license/">here</a> for contribution &amp; translation guidelines.</p>
</div>
