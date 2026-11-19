---
title: "Персональный сайт на Hugo Blox"
date: 2026-05-10
links:
  - type: site
    url: github.com/PonomarevaVA0/blog_1
tags:
  - Hugo
  - HugoBlox
  - Markdown
---

## Описание

Создание сайта-портфолио на Hugo Blox с блогом, научными профилями и автодеплоем.

## Цели

- Освоить Hugo и Hugo Blox
- Научиться работать с Git
- Настроить CI/CD
- Интегрировать научные профили

## Этап 1. Установка

sudo dnf install hugo git golang

## Этап 2. Создание сайта

hugo new site blog_1
cd blog_1
hugo mod init github.com/PonomarevaVA0/blog_1
hugo mod get github.com/HugoBlox/kit

## Этап 3. Структура

hugo new --kind authors me
hugo new blog/hello-world/index.md

## Этап 4. Главная страница

Файл content/_index.md:
sections:
  - block: resume-biography-3
    content:
      username: me
  - block: collection
    content:
      title: Блог
      filters:
        folders:
          - blog

## Этап 5. Профиль автора

Файл content/authors/me/_index.md:
title: Варвара Пономарева
role: Студент РУДН
social:
  - icon: orcid
    icon_pack: ai
    link: https://orcid.org/0009-0000-3695-3717
  - icon: github
    icon_pack: fab
    link: https://github.com/PonomarevaVA0

## Этап 6. Посты блога

hugo new blog/weekly-1/index.md
hugo new blog/weekly-2/index.md
hugo new blog/ci-cd/index.md
hugo new blog/bibliography/index.md
hugo new blog/scientific-languages/index.md

## Этап 7. Проекты

hugo new project/website/index.md
hugo new project/github-labs/index.md

## Этап 8. Научные профили

ORCID: 0009-0000-3695-3717
eLibrary: elibrary.ru
Google Scholar: scholar.google.com
Mendeley: mendeley.com
ResearchGate: researchgate.net
Academia.edu: academia.edu
arXiv: arxiv.org
GitHub: github.com/PonomarevaVA0

## Этап 9. CI/CD

Файл .github/workflows/deploy.yml:
name: Deploy
on:
  push:
    branches: ["main"]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: peaceiris/actions-hugo@v2
      - run: hugo --minify
      - uses: actions/upload-pages-artifact@v3
  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/deploy-pages@v4

## Этап 10. Публикация

git add .
git commit -m "Сайт готов"
git push

## Результат

Сайт с блогом из 6 постов, 2 проектами, 8 научными профилями и автодеплоем.

## Ссылки

Репозиторий: github.com/PonomarevaVA0/blog_1
Сайт: ponomarevava0.github.io/blog_1

<!--more-->
