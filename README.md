# ☁️ Otimização de Atendimento com Screen Flow (Salesforce Service Cloud)

## 🎯 O Cenário e o Desafio de Negócio
Em operações de provedores de internet (ISP), o Tempo Médio de Atendimento (TMA) é uma métrica crítica. No cenário atual ("As-Is"), os agentes de suporte precisavam navegar por múltiplas telas no Salesforce para consultar dados da Conta, ler scripts de atendimento em blocos de notas e criar manualmente Ordens de Trabalho (Work Orders). 
**Resultado:** Alto TMA, redundância de cliques e chance de erro humano na triagem.

## 💡 A Solução (To-Be)
Foi desenhada e implementada uma solução nativa no Salesforce utilizando **Screen Flows**. O fluxo atua como um guia passo a passo na própria tela do Caso, unificando o script de diagnóstico (troubleshooting) e automatizando as ações de banco de dados (DML).

### 🛠️ Arquitetura Funcional e Árvore de Decisão
*(Aqui futuramente vamos colocar a imagem do seu fluxograma feito no Miro/Draw.io)*

O fluxo segue 3 etapas principais de validação com o cliente:
1. **Validação de Energia:** Verifica se o equipamento liga.
2. **Validação de Sinal Óptico:** Diagnóstico de luzes indicadoras (LOS/PON) para detectar rompimento de fibra.
3. **Troubleshooting Nível 1:** Reinicialização forçada guiada.

### ⚙️ Objetos e Automações Envolvidas
* **Objeto de Entrada:** `Case` (O fluxo captura o `recordId` para contexto imediato).
* **Automação de Saída 1 (Sucesso):** Atualiza o Status do Caso para `Closed` com os detalhes da resolução.
* **Automação de Saída 2 (Falha Física):** Atualiza o Status do Caso para `Escalated` e gera automaticamente um registro no objeto `Work Order` para agendamento de visita técnica.

## 🚀 Como testar/visualizar
*(Aqui colocaremos o GIF de você utilizando o fluxo na tela do Service Cloud)*

---
*Projeto desenvolvido como estudo de caso de Análise Funcional e Automação no ecossistema Salesforce.*
