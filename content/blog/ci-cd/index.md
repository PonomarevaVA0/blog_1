---
title: "Непрерывная интеграция и непрерывное развертывание (CI/CD): основы и практическое применение"
summary: "Обзор концепций CI/CD, их роли в современной разработке и пример настройки для сайта на Hugo"
date: 2025-03-19

# Featured image
image:
  caption: ''

cover:
  image: "https://images.unsplash.com/photo-1667372393119-3d4c48d07fc9?w=1200"
  position:
    x: 50
    y: 40
  overlay:
    enabled: true
    opacity: 0.3
  fade:
    enabled: true
    height: "80px"

authors:
  - me

tags:
  - cicd
  - devops
  - github-actions
  - hugo

content_meta:
  trending: false
---

## Введение

{{< toc mobile_only=true is_open=true >}}

В современной разработке программного обеспечения важную роль играют практики непрерывной интеграции (Continuous Integration, CI) и непрерывного развертывания (Continuous Deployment, CD). Они позволяют автоматизировать процессы сборки, тестирования и доставки кода, сокращая время между написанием кода и его попаданием в production.

## Что такое CI/CD

**Непрерывная интеграция (CI)** — это практика, при которой разработчики регулярно (несколько раз в день) объединяют свои изменения в центральный репозиторий. После каждого объединения автоматически запускаются сборка и тестирование проекта. Это позволяет:

- Обнаруживать ошибки на ранних этапах
- Сокращать время на разрешение конфликтов слияния
- Поддерживать код в работоспособном состоянии

**Непрерывное развертывание (CD)** — это логическое продолжение CI, при котором каждое изменение, прошедшее все стадии проверки, автоматически развертывается на production-среду. В отличие от непрерывной доставки (Continuous Delivery), где развертывание требует ручного подтверждения, при CD процесс полностью автоматизирован.

## Преимущества внедрения CI/CD

| Преимущество | Описание |
|--------------|----------|
| Скорость | Автоматизация сокращает время от написания кода до доставки пользователю |
| Качество | Автоматические тесты выявляют проблемы до попадания в production |
| Надежность | Стандартизированный процесс развертывания снижает риск человеческой ошибки |
| Обратная связь | Разработчики получают быструю обратную связь о состоянии их изменений |

## Практический пример: настройка CI/CD для сайта на Hugo

В рамках текущего проекта был настроен автоматический деплой сайта на платформе Hugo Blox с использованием GitHub Actions. Конфигурация включает следующие этапы:

1. **Событие-триггер**: при пуше в ветку `main` или `master`
2. **Сборка проекта**: установка Hugo, сборка статических файлов
3. **Развертывание**: публикация собранного сайта на GitHub Pages

### Пример конфигурации GitHub Actions

```yaml
name: Deploy Hugo site to Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/configure-pages@v4
      - uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
      - run: hugo --minify
      - uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  deploy:
    needs: build
    permissions:
      pages: write
      id-token: write
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - uses: actions/deploy-pages@v4
