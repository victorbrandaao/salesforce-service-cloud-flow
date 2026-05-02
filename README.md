# Otimização de Atendimento B2B com Screen Flow (Salesforce Service Cloud)

Este repositório documenta a arquitetura e os metadados de um **Screen Flow** desenvolvido para a **Connecta Solutions** (empresa fictícia B2B). O objetivo do projeto foi reduzir o Tempo Médio de Atendimento (TMA) do Service Cloud, unificando o roteiro de troubleshooting do provedor de internet (ISP) e automatizando a criação de registros dependentes.

Projeto desenvolvido como estudo de caso prático de Análise Funcional e Platform Engineering durante o **Training Camp DreamXP** em parceria com a **Pitang**.

## 📌 Contexto de Negócio e Dores (As-Is)
Antes da implementação, a operação de atendimento sofria com:
- **Silos de Informação:** O agente precisava alternar entre telas de Conta, Caso e bases de conhecimento externas (roteiros em bloco de notas).
- **Esforço Manual (Swivel Chair):** Criação manual de **Work Orders** para agendamento de visitas técnicas, aumentando a chance de erros de digitação e esquecimentos.
- **TMA Elevado:** A triagem física (verificação de luzes do modem/sinal óptico) era ineficiente e dependia da interpretação do agente.

## 🚀 A Solução (To-Be)
Foi desenhada uma solução nativa utilizando a filosofia *"Clicks, not Code"*, mas com governança de metadados. O Screen Flow atua como um assistente guiado diretamente na página do **Case** (Lightning Record Page), garantindo que o agente siga o script homologado pela engenharia de telecomunicações.

### Lógica da Arquitetura de Decisão
O fluxo foi estruturado em três ramificações principais de diagnóstico:

1. **Camada de Energia (Power):** Validação de conectividade elétrica do equipamento (CPE).
2. **Sinal Óptico (LOS/PON):** Identificação de anomalias na fibra via comportamento dos LEDs, isolando problemas lógicos de rompimentos físicos.
3. **Troubleshooting Nível 1:** Script guiado para reinicialização e re-provisionamento básico antes do escalonamento.

### Automações e DML Operacional
- **Contexto de Execução:** O Flow recebe o `recordId` dinamicamente da página para atuar no contexto exato do atendimento.
- **Resolução em Nível 1:** Havendo sucesso no script guiado, o sistema executa um `Update Records` alterando o status do `Case` para `Closed` e injetando o log de resolução.
- **Escalonamento Físico:** Identificada falha física (Ex: LOS vermelho), o Flow atualiza o `Case` para `Escalated` e executa um `Create Records` gerando automaticamente uma **Work Order** vinculada à Conta, pronta para a fila de Field Service.

## 🛠️ Tecnologias e Governança
- **Salesforce Service Cloud:** Lightning App Builder, Screen Flows.
- **Platform Engineering:** Gestão dos metadados da Org (arquivos `.flow-meta.xml`) versionados via **Salesforce CLI** e **VS Code**.



---
*Construído na interseção entre análise de negócios e engenharia de plataforma.*
