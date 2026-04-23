# Otimização de Atendimento com Screen Flow (Salesforce Service Cloud)

Este repositório reúne um **Screen Flow** pensado para **reduzir o TMA** no atendimento de um provedor de internet (ISP), trazendo o roteiro de troubleshooting para dentro do Salesforce e automatizando os próximos passos do caso.

## Contexto (dor atual)
No cenário atual, o atendimento dependia de muita navegação e tarefas manuais. Em geral, o agente precisava:

- alternar entre telas para consultar dados de Conta e do Caso;
- seguir roteiros de diagnóstico em documentos externos (ex.: bloco de notas);
- criar **Work Orders** manualmente quando era necessária visita técnica.

**Impacto:** mais tempo por atendimento, repetição de cliques e maior chance de erro na triagem.

## O que foi implementado
A solução foi construída de forma nativa no Salesforce com **Screen Flow**, executando o passo a passo diretamente na tela do **Case**.

O fluxo funciona como um “assistente” de atendimento:
- guia o agente pelas perguntas/validações com o cliente;
- registra o resultado do diagnóstico;
- automatiza as atualizações e criações de registros necessárias (DML).

## Lógica do fluxo (visão funcional)
> TODO: adicionar aqui uma imagem do fluxograma (Miro/Draw.io)

O fluxo foi organizado em 3 blocos principais:

1. **Energia**  
   Confere se o equipamento está ligado e responde como esperado.

2. **Sinal óptico (LOS/PON)**  
   Ajuda a identificar, a partir dos LEDs, indícios de problema físico (ex.: possível rompimento/falha de fibra).

3. **Troubleshooting Nível 1**  
   Roteiro guiado de reinicialização/validações simples antes de escalar.

## Objetos e automações
- **Entrada:** `Case` (o Flow usa o `recordId` para operar no contexto do caso aberto).
- **Saída (quando resolve):** atualiza o `Case` para `Closed` e registra os detalhes da resolução.
- **Saída (quando indica falha física):** atualiza o `Case` para `Escalated` e cria um registro em `Work Order` para agendamento da visita técnica.

## Como testar / visualizar
> TODO: incluir um GIF do Flow rodando no Service Cloud

---

Projeto desenvolvido como estudo de caso de análise funcional e automação no ecossistema Salesforce.
