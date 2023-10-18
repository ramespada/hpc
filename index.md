---
layout: page
title: Computación de Alta Performance 
nositetitle: true
---

El objetivo de este curso es exponer las bases para el desarrollo de aplicaciones de alta performance, con enfasis en los aspectos prácticos de su programación e implementación.

El curso no asume conocimientos previos de programación, por lo que en la primer parte se da una intruducción al uso de linea de comando (*shell*), la sintaxis de los lenguajes más utilizados en esta disciplina (`C` y `Fortran`), asi también como herramientas para compilar, desarrollar, debuggear y perfilar programas.

El foco del curso está puesto en la implementación de programas (en C ó Fortran) que exploten la paralelización de distintos problemas bajo arquitecturas de cómputo de memoria compartida (`openMP`), memoria distribuida (`MPI`) y en aceleradores ó GPUs (`CUDA`, `openACC` y `openCL`). El espíritu es analizar el incremento en la performance (*speedup*) en comparación a sus respectivas versiones seriales ó secuenciales, y el analisis de la escalabilidad de cada herramienta.

Acá podés encontrár algunos de [problemas](/tps/) que trataremos en el curso.

# Programa del curso

<ul>
{% assign clases = site['clases'] | sort: 'date' %}
{% for clase in clases %}
    {% if clase.phony != true %}
        {% if clase.ready %}
        <li>
        <strong>{{ clase.date | date: 'C%-m.%-d' }}</strong>:
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

Los video tutoriales estarán disponible [en Youtube](https://www.youtube.com/@ramiroespadaguerrero/playlists).

---

<div class="small center">
<p><a href="https://github.com/ramespada/hpc">Repositorio</a>.</p>
<p>Licencia CC</p>
</div>
