---
layout: lecture
date: 2023-01-05
title: Git
description: Control de versiones
ready: true
---

# Git

> Git es un sistema de control de cambios que permite llevar registro de modificaciones realizadas en los archivos de un repositorio, asi como facilitar la colaboración entre otras cosas.
 

### Iniciar un repositorio:

```shell
	git init
```

### Agregar archivo y preparar para commit

```shell
	cat "hello world" > hello.txt
	git add hello.txt
```

Tambien realizarlo de forma interactiva con el comando:

```shell
	git add -p
```

esto inicia sesión de ensayo interactiva que permite elegir las partes de un archivo que queres añadir a la siguiente confirmación. Se te presentarán una serie de cambios y se te solicitará un comando. Utiliza `y` para preparar el fragmento, `n` para ignorarlo, `s` para dividirlo en fragmentos más pequeños, `e` para editarlo manualmente y q para salir.


### Ver estado de repositorio

```shell
	git status
```

### Commit cambios

```shell
	git commit -m "add hello file"
```
Cada commit es como una *fotografía* del repositorio que queda guardada.

Otras opciones de commit:
```shell
	git commit -a
```

Tambien se pude hacer un comit salteando el comando `add` a un archivo en particular:
```shell
	git commit <file>
```


### Ver historia del repostorio
```shell
	git log --all --graph --decorate
```

### Ver historial de cambios comandos usados

```shell
	git reflog

```

### Crear branch
```shell
	git branch myBranch
	git checkout myBranch
```


```shell
	git checkout -b myBranch
```

### Merge:

```shell
	git merge -b myBranch
```

### Ir a otros commits o branches:
```shell
	git checkout myBranch
```

### Respositorio remoto

Clonar repositorio remoto:
```shell
	git clone origin master
```

Crear respositorio remoto:
```shell
	git remote
```

Llevar cambios a repositorio remoto:

```shell
	git push
```

Traer objetos y referencias de repo remoto:
```shell
	git fetch
```

Traer la version existente en repositorio remoto al repositorio local
```shell
	git pull
```

es lo mismo que hacer:
```shell
	git pull; git merge
```


### Avanzado:

Ir a commits antiguos y modificar historial, combinar commits, etc.

```shell
	git rebase -i HEAD~N
```

### UNDO errores:

`git restore` sirve para recuperar archivos borrados, o modificados y dejarlos como en el ultimo commit.

```shell
	git restore <archivo>
```

se puede usar de formar interactiva por *patches* con `git restore -p`


Modificar ultimo commit:
```shell
	git commit --amend -m "correccion"
```

Borrar commits luego de cierto nivel, voy con checkout al lugar que quiero y luego
```shell
	git reset --herd
```


Recuperar commits borrados:

```shell
	git reflog
```

Recuperar branches borrados:
```shell
	git reflog
```

### Customización:


+ `git config --global user.name <name>`
+ `git config --global user.email <email>`
+ `git config --global user.alias <alias-name> <git-command>`
+ `git config --system core.editor <editor>`


Para ver archivo de configuración, y editar variables:
+ `git config --global --edit`
+ `git config --local  --edit`
+ `git config --system --edit`



---

## Resumen Git command-line interface

- `git help <command>`: get help for a git command
- `git init`: creates a new git repo, with data stored in the `.git` directory
- `git status`: tells you what's going on
- `git add <filename>`: adds files to staging area
- `git commit`: creates a new commit
    - Write [good commit messages](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html)!
    - Even more reasons to write [good commit messages](https://chris.beams.io/posts/git-commit/)!
- `git log`: shows a flattened log of history
- `git log --all --graph --decorate`: visualizes history as a DAG
- `git diff <filename>`: show changes you made relative to the staging area
- `git diff <revision> <filename>`: shows differences in a file between snapshots
- `git checkout <revision>`: updates HEAD and current branch

## Branching and merging

- `git branch`: shows branches
- `git branch <name>`: creates a branch
- `git checkout -b <name>`: creates a branch and switches to it
    - same as `git branch <name>; git checkout <name>`
- `git merge <revision>`: merges into current branch
- `git mergetool`: use a fancy tool to help resolve merge conflicts
- `git rebase`: rebase set of patches onto a new base

## Remotes

- `git remote`: list remotes
- `git remote add <name> <url>`: add a remote
- `git push <remote> <local branch>:<remote branch>`: send objects to remote, and update remote reference
- `git branch --set-upstream-to=<remote>/<remote branch>`: set up correspondence between local and remote branch
- `git fetch`: retrieve objects/references from a remote
- `git pull`: same as `git fetch; git merge`
- `git clone`: download repository from remote

## Undo

- `git commit --amend`: edit a commit's contents/message
- `git reset HEAD <file>`: unstage a file
- `git checkout -- <file>`: discard changes

# Advanced Git

- `git config`: Git is [highly customizable](https://git-scm.com/docs/git-config)
- `git clone --depth=1`: shallow clone, without entire version history
- `git add -p`: interactive staging
- `git rebase -i`: interactive rebasing
- `git blame`: show who last edited which line
- `git stash`: temporarily remove modifications to working directory
- `git bisect`: binary search history (e.g. for regressions)
- `.gitignore`: [specify](https://git-scm.com/docs/gitignore) intentionally untracked files to ignore
