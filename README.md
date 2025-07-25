# Manual de Treinamento - Plataforma Autonomia

[![Status](https://img.shields.io/badge/Status-Produção-success)](https://plataforma.autonomia.site)
![Versão](https://img.shields.io/badge/Versão-1.0-blue)

Manual de treinamento oficial para administradores e usuários da Plataforma Autonomia, baseado no Chatwoot 4.x.

![Logo da Autonomia](https://plataforma.autonomia.site)

## 📋 Conteúdo do Manual

O manual abrange os seguintes tópicos:

1. **Introdução e Conceitos Básicos**
   - Visão geral da plataforma
   - Glossário de termos e conceitos
   - Estrutura da plataforma (canais, caixas de entrada, conversas)

2. **Primeiros Passos para Administradores**
   - Configuração inicial da conta
   - Gerenciamento de usuários e agentes
   - Configuração de perfis e permissões

3. **Canais de Comunicação**
   - Configuração do chat do site
   - Integração com e-mail e WhatsApp
   - Integração com redes sociais

4. **Gerenciamento de Conversas**
   - Interface de conversas
   - Atribuição e status de conversas
   - Macros e automações

5. **Gerenciamento de Contatos**
   - Criação e importação de contatos
   - Segmentação e atributos personalizados

6. **Automações e Fluxos de Trabalho**
   - Regras de automação
   - Fluxos de trabalho comuns

7. **Central de Ajuda**
   - Configuração da Central de Ajuda
   - Criação de categorias e artigos

8. **Relatórios e Análises**
   - Métricas e KPIs
   - Relatórios disponíveis

9. **Integrações Avançadas**
   - APIs e Webhooks
   - Integrações com outros sistemas

10. **Personalização e Marca**
    - Personalização da interface
    - Configuração de marca

11. **Melhores Práticas**
    - Organização de equipes
    - Estratégias de atendimento

12. **Configurações Gerais**
    - Opções de configuração
    - Perfis e segurança

## 🚀 Implantação

Este projeto pode ser implantado em qualquer ambiente Docker com Docker Swarm, Traefik e Portainer.

### Pré-requisitos

- Docker Swarm inicializado
- Traefik configurado como proxy reverso
- Portainer (opcional, para gerenciamento via UI)

### Instalação via Docker Swarm CLI

```bash
# Clone o repositório
git clone https://github.com/autonom-ia/plataforma-manual.git
cd plataforma-manual

# Construa a imagem Docker
docker build -t autonomia/manual:latest .

# Implante o stack
docker stack deploy -c docker-compose.yml manual_plataforma
```

### Instalação via Portainer

1. Acesse o Portainer
2. Navegue até "Stacks" e clique em "Add stack"
3. Dê o nome "manual_plataforma" ao stack
4. Escolha uma das opções:
   - **Web editor**: Cole o conteúdo do docker-compose.yml
   - **Git repository**: Use a URL https://github.com/autonom-ia/plataforma-manual.git
5. Clique em "Deploy the stack"

## 🔧 Configuração

O arquivo `docker-compose.yml` contém todas as configurações necessárias para o deployment:

```yaml
version: '3.7'

services:
  manual_plataforma:
    image: autonomia/manual:latest
    build:
      context: .
      dockerfile: Dockerfile
    networks:
      - network_public
    deploy:
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.manual_plataforma.rule=Host(`plataforma.autonomia.site`)"
        - "traefik.http.routers.manual_plataforma.entrypoints=websecure"
        - "traefik.http.routers.manual_plataforma.tls.certresolver=letsencryptresolver"
        - "traefik.http.routers.manual_plataforma.priority=1"
        - "traefik.http.routers.manual_plataforma.service=manual_plataforma"
        - "traefik.http.services.manual_plataforma.loadbalancer.server.port=80"
        - "traefik.http.services.manual_plataforma.loadbalancer.passhostheader=true"
        - "traefik.http.middlewares.sslheader.headers.customrequestheaders.X-Forwarded-Proto=https"
        - "traefik.http.routers.manual_plataforma.middlewares=sslheader@docker"

networks:
  network_public:
    external: true
```

### Personalização

Para personalizar o manual:
1. Edite o arquivo `treinamento.html`
2. Atualize as imagens conforme necessário
3. Reconstrua a imagem Docker e reimplante o stack

## 📄 Estrutura do Projeto

```
plataforma-manual/
├── treinamento.html     # Arquivo principal do manual
├── Dockerfile          # Configuração Docker
├── docker-compose.yml  # Configuração do stack Docker
├── nginx.conf          # Configuração do Nginx
├── *.png               # Imagens do manual
└── README.md           # Este arquivo
```

## ✨ Funcionalidades

- **Manual completo e detalhado** para administradores da Plataforma Autonomia
- **Layout responsivo** que se adapta a diferentes dispositivos
- **Versão para impressão otimizada** sem elementos desnecessários
- **Navegação simples** com índice lateral e links internos
- **Design moderno** com identidade visual da Autonomia

## 🖨️ Impressão

O manual conta com CSS otimizado para impressão. Para imprimir:
1. Acesse o manual no navegador
2. Use a função de impressão do navegador (Ctrl+P / Cmd+P)
3. Será gerado um PDF limpo e bem formatado, sem elementos de navegação

## 🔄 Atualizações e Manutenção

Para atualizar o manual:

1. Clone o repositório
2. Faça as alterações necessárias
3. Envie um pull request ou commit direto para o repositório

## 👨‍💻 Desenvolvimento

Para desenvolvimento local:

```bash
# Clone o repositório
git clone https://github.com/autonom-ia/plataforma-manual.git
cd plataforma-manual

# Abrir o arquivo HTML no navegador
open treinamento.html
```

## 📝 Licença

Este projeto é propriedade da Autonomia e sua distribuição não autorizada é proibida.

© 2025 Autonomia - Todos os direitos reservados.
