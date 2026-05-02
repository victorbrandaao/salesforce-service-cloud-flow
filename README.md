# 🏢 Connecta Solutions | Salesforce Architecture Monorepo

Este repositório consolida a arquitetura, metadados e integrações desenvolvidas para a **Connecta Solutions** (empresa fictícia B2B do segmento de Telecomunicações/ISP). 

O projeto foi construído durante o **Training Camp DreamXP (Pitang)**, com atuação focada em Análise Funcional, aplicando conceitos de Engenharia de Plataforma (Platform Engineering) e governança de dados no ecossistema Salesforce.

---

## 🛠️ Módulo 1: Sales Cloud (Captação e Governança de Leads)
Focado na otimização do funil de vendas B2B, este módulo desacopla a captura de leads do CRM, utilizando um front-end customizado e garantindo a higienização de dados via Backend (Apex) antes da persistência no banco de dados.

*   **Front-end Customizado (Web-to-Lead):** Landing page responsiva e estilizada, com validação de dados via JavaScript no lado do cliente (localizado na pasta `/b2b-landing-page`).
*   **Apex Trigger (Middleware de Higienização):** Gatilho `before insert` e `before update` desenvolvido em Apex (`FormataTelefoneLead.trigger`) para interceptar o payload, aplicando Regex para padronizar telefones automaticamente no padrão `(XX) XXXXX-XXXX`.
*   **Governança (Validation Rule):** Regra de validação rígida implementada nos metadados do Lead para garantir que a arquitetura rejeite qualquer entrada de dados fora do padrão estipulado.

---

## 🎧 Módulo 2: Service Cloud (Otimização de Atendimento e Field Service)
Focado em reduzir o Tempo Médio de Atendimento (TMA) do suporte técnico e eliminar processos manuais (*swivel chair*).

*   **Troubleshooting Nível 1 (Screen Flow):** Assistente guiado diretamente na Lightning Record Page do `Case`. O fluxo consolida roteiros de verificação de energia elétrica e sinal óptico (LOS/PON).
*   **Automação DML:** 
    *   **Resolução:** Atualização automática do status do Caso e injeção do log de atendimento.
    *   **Escalonamento Físico:** Identificação de falha física na fibra, gerando automaticamente a criação de uma `Work Order` para agendamento da visita técnica.

---

## 💻 Tecnologias Utilizadas
*   **Salesforce Ecosystem:** Sales Cloud, Service Cloud, Lightning App Builder, Screen Flows.
*   **Desenvolvimento Backend:** Apex (Triggers), SOQL, Validation Rules (Regex).
*   **Desenvolvimento Frontend:** HTML5, CSS3, Vanilla JavaScript.
*   **DevOps & Ferramentas:** Salesforce CLI (SFDX), VS Code, Git/GitHub.
