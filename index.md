---
layout: page
title: Computación de Alto Rendimiento 
nositetitle: true
---

El objetivo de este curso es exponer las bases para el desarrollo de aplicaciones de alta performance, con enfasis en los aspectos prácticos de su programación e implementación.

El curso asume conocimientos previos de programación en C y/o Fortran y uso de Shell en entorno UNIX, por lo que se recomienda tomar [este curso](https://ramespada.github.io/sintaxis) primero. 

El foco del curso está puesto en la implementación de programas (en C ó Fortran) que exploten la paralelización de distintos problemas bajo arquitecturas de cómputo de memoria compartida (`openMP`), memoria distribuida (`MPI`) y en aceleradores ó GPUs (`CUDA`, `openACC` y `openCL`). 
El espíritu es analizar el incremento en la performance (*speedup*) en comparación a sus respectivas versiones seriales, analizar la *escalabilidad* de cada herramienta.

Acá podés encontrár algunas de [aplicaciones](./ejemplos/) que trataremos en el curso.

# Programa del curso

<ul>
{% assign clases = site['clases'] | sort: 'date' %}
{% for clase in clases %}
    {% if clase.phony != true %}
      {% if clase.ready %}
        <li>
        <strong>{{ clase.date | date: 'C%-m.%-d' }}</strong>:
            <a href="{{site.baseurl}}{{ clase.url }}">{{ clase.title }}</a>
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
