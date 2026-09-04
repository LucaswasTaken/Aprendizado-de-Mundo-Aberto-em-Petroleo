# Relatório de revisão técnica dos capítulos

**Obra:** *Aprendizado de Mundo Aberto em Poços de Petróleo*  
**Escopo:** `livro/main.tex`, capítulos 1 a 18 e referências associadas  
**Data da revisão:** 3 de setembro de 2026

## 1. Resumo executivo

O manuscrito é bem estruturado, compila integralmente e, em geral, cumpre os objetivos pedagógicos declarados. Não foi encontrada evidência de citações inventadas nem de um modelo de linguagem inexistente. Foram encontrados, contudo, erros conceituais demonstráveis, inconsistências estatísticas, comparações não controladas apresentadas como progressão causal e afirmações operacionais que dependem de evidência privada não disponível no repositório.

### Achados prioritários

| Prioridade | Local | Achado |
|---|---|---|
| Crítica | Cap. 9 | `98,3%` de acerto exato de $K$ e MAE `1,12` implicam erro médio de aproximadamente 66 grupos nos 1,7% de casos errados; isso contradiz a interpretação de erros de um ou poucos grupos. |
| Alta | Caps. 3 e 14 | Aplicar escore-$z$ e depois Min-Max sobre a mesma amostra é algebricamente equivalente a aplicar apenas Min-Max. A alegação de que as duas etapas removem nível/escala e de que inverter a ordem “reintroduz” dependência é falsa sem parâmetros ajustados em conjuntos distintos. |
| Alta | Cap. 5 | Achatar uma série para um MLP não elimina a ordem: cada posição temporal continua em uma coordenada distinta. O MLP perde o viés arquitetural de localidade/equivariância e é pouco eficiente, mas não é invariante a permutações. |
| Alta | Cap. 7 | Para o limiar unilateral $\mu+3\sigma$, a taxa gaussiana nominal de falso positivo é cerca de `0,135%`; `0,27%` corresponde às duas caudas. O texto usa `0,3%`. |
| Alta | Caps. 4 e 7–15 | A regra “toda proporção com $n<200$ vem acompanhada de IC” é violada por diversas tabelas, inclusive resultados por classe. |
| Alta | Caps. 3, 15, 16 e 18 | O confundimento entre anomalia e perda de telemetria pode afetar grande parte dos resultados no 3W. A ressalva é correta, mas aparece tarde e ainda não foi quantificada. |
| Alta | Caps. 11, 12 e 16 | Resultados de tarefas/protocolos diferentes são descritos como “saltos” atribuíveis a uma única mudança. Isso não estabelece causalidade sem experimento controlado ou ablação. |
| Alta | Cap. 13 | O modelo Qwen3.5-397B-A17B existe e os números 397B/17B estão corretos, mas a referência `Qwen2025` é do Qwen3, não do Qwen3.5 de 2026. |
| Média | Cap. 17 | O objetivo promete estimar custo total de operação, mas o capítulo apresenta apenas latência, memória e categorias qualitativas de custo. |

### Classificação geral

- **Erros demonstráveis:** normalização em duas etapas; ordem temporal no MLP; cauda de $3\sigma$; incompatibilidade acurácia/MAE de $K$.
- **Inconsistências internas:** política de intervalos de confiança; “quatro sinais fundamentais” versus métodos com 5 ou 8 sinais; prioridade declarada versus ordem da agenda futura.
- **Exageros:** “melhoria uniforme prova método correto”, “torna implantável”, “propriedade do problema”, “trocar uma linha”, “sem custo em acurácia”.
- **Alucinações confirmadas:** nenhuma.
- **Alegações que exigem comprovação adicional:** escala da implantação industrial, casos reais privados, tempo de 30 minutos a 5 horas atribuído ao artigo 3W, calibração dos limiares operacionais e resultados derivados de trabalhos ainda apresentados como preprint.

## 2. Método e limites da revisão

A revisão seguiu quatro passos:

1. leitura da ordem de inclusão em `livro/main.tex` e dos 18 capítulos;
2. comparação de cada item de `objetivos` com o desenvolvimento, resultados, resumo e exercícios do próprio capítulo;
3. verificação cruzada de números e afirmações repetidos em capítulos posteriores;
4. compilação completa e inspeção de chaves bibliográficas e fontes públicas selecionadas.

A compilação produziu **239 páginas, 0 erros, 0 referências indefinidas e 0 caixas overfull acima de 20 pt**. A existência de uma chave em `livro/referencias.bib` não prova que o artigo sustente toda afirmação associada. Resultados de dados privados e artigos sem artefatos reproduzíveis foram classificados como “requer validação”, não como falsos.

## 3. Auditoria por capítulo

### Capítulo 1 — Por que vigiar um poço de petróleo

**Objetivos:** 4 cumpridos; 1 parcialmente cumprido. O texto explica monitoramento, distingue detecção/classificação/explicação, introduz mundo fechado e apresenta o percurso. A promessa de “quantificar o impacto do NPT” é apenas parcialmente cumprida: o corpo define a composição do custo, mas o cálculo monetário aparece somente como exercício ([cap01_introducao.tex](../livro/capitulos/cap01_introducao.tex#L84), [cap01_introducao.tex](../livro/capitulos/cap01_introducao.tex#L277)).

**Achados:**

- **Exagero:** dizer que aprendizado de máquina foi construído “exatamente” para inferência sob observação parcial é historicamente e tecnicamente absoluto; ML cobre classe muito mais ampla de problemas ([cap01_introducao.tex](../livro/capitulos/cap01_introducao.tex#L32)).
- **Imprecisão:** deriva de sensor não faz o conhecimento “simplesmente não existir”; produz observação enviesada e potencialmente detectável.
- **Evidência insuficiente:** a implantação em mais de 20 unidades e 250 poços e os casos operacionais são plausíveis e citados, mas dependem de fonte industrial/privada. Recomenda-se indicar período, operadora anonimizada, critério de contagem e documento primário.
- **Promessa econômica:** incluir um exemplo resolvido de NPT com produção perdida, preço, custo de intervenção e análise de sensibilidade.

### Capítulo 2 — Anatomia de um poço submarino

**Objetivos:** 4 cumpridos; 1 parcialmente cumprido. Componentes, válvulas, sensores, nove classes, causa-raiz/sintoma e ICV são desenvolvidos. A formulação “por que exatamente essas quatro variáveis dominam os métodos” é forte demais ([cap02_dominio.tex](../livro/capitulos/cap02_dominio.tex#L8)).

**Achados:**

- **Inconsistência:** o capítulo chama quatro sinais de fundamentais, mas a tabela do capítulo 3 registra 5 sinais no sistema dual e 8 nos classificadores binários/closed-world. Substituir “exatamente” por “por que este subconjunto de quatro é recorrente” e explicar as exceções.
- **Generalização física:** interpretações de gradiente entre PDG e TPT dependem de localização, regime multifásico, vazão e disponibilidade dos sensores; apresentar como aproximação condicionada, não regra universal ([cap02_dominio.tex](../livro/capitulos/cap02_dominio.tex#L165)).
- **Editorial:** `esquema_vazio.png` existe e compila, portanto não é figura ausente; o nome sugere artefato provisório. Renomear para um nome semântico e registrar a licença/origem.
- **Validação especializada:** revisar a nomenclatura e posição típica das válvulas com especialista de completação, pois há variação entre operadoras já reconhecida pelo próprio texto.

### Capítulo 3 — Os dados

**Objetivos:** todos cumpridos em conteúdo. O capítulo formaliza séries, versões do 3W, rótulos, armadilhas e particionamento.

**Achados:**

- **Erro matemático:** para parâmetros calculados sobre o mesmo conjunto,
  $$\operatorname{MinMax}(z(x))=\frac{x-\min x}{\max x-\min x}=\operatorname{MinMax}(x).$$
  Logo, padronizar e depois aplicar Min-Max cancela o efeito do escore-$z$. A ordem inversa seguida de novo escore-$z$ também não “reintroduz o nível absoluto” ([cap03_dados.tex](../livro/capitulos/cap03_dados.tex#L346)).
- **Correção necessária:** declarar em que conjunto cada transformador é ajustado e por que os parâmetros diferem. Se ambos usam os mesmos dados, remover uma etapa. Se o escore-$z$ usa baseline por poço e o Min-Max usa limites globais de treino, escrever isso explicitamente e demonstrar a transformação.
- **Causalidade não demonstrada:** “anomalia e interrupção de telemetria têm causa comum” deve ser hipótese, não explicação consolidada, até a análise de confundimento proposta no capítulo 18.
- **Escopo:** as contagens das versões 1.0/2.0 e procedências estão citadas; manter tabela de rastreabilidade para versão, commit/DOI e filtros usados em cada experimento.

### Capítulo 4 — Aprendizado de máquina e avaliação

**Objetivos:** todos cumpridos, mas um procedimento estatístico é ensinado de forma incompleta.

**Achados:**

- **Erro metodológico:** sobreposição de dois intervalos de Wilson não é teste de diferença entre métodos, sobretudo quando ambos são avaliados sobre os mesmos exemplos. A comparação é pareada; usar McNemar, bootstrap pareado ou intervalo da diferença ([cap04_aprendizado.tex](../livro/capitulos/cap04_aprendizado.tex#L271)).
- **Inconsistência global:** a regra “toda proporção com $n<200$ vem acompanhada de intervalo” ([cap04_aprendizado.tex](../livro/capitulos/cap04_aprendizado.tex#L286)) é contrariada por tabelas por classe dos capítulos 8, 10, 12 e 15.
- **Promessa de cálculo:** há fórmula e exemplo de Wilson, portanto o objetivo é cumprido; adicionar um exemplo pareado para evitar que o leitor use sobreposição de IC como teste.
- **Terminologia:** esclarecer que IoU não é “mais exigente” em sentido absoluto; ele simplesmente exclui verdadeiros negativos e mede sobreposição da classe positiva.

### Capítulo 5 — Aprendizado profundo para séries temporais

**Objetivos:** 6 cumpridos; 1 parcialmente cumprido. O panorama cobre as arquiteturas prometidas, mas a justificativa sobre MLP contém erro.

**Achados:**

- **Erro conceitual:** achatar uma matriz temporal preserva a posição de cada amostra. Permutar os instantes altera as coordenadas e, em geral, a saída do MLP. O problema correto é ausência de compartilhamento de pesos, localidade e equivariância a deslocamentos, além do crescimento de parâmetros ([cap05_profundo.tex](../livro/capitulos/cap05_profundo.tex#L38)).
- **Exagero estatístico:** chamar a diferença `0,691 ± 0,162` versus `0,755 ± 0,171` de “real” não é sustentado sem distribuição pareada ou teste; os intervalos de dispersão se sobrepõem fortemente ([cap05_profundo.tex](../livro/capitulos/cap05_profundo.tex#L46)).
- **Campo receptivo:** substituir “ultrapassa 80” por cálculo explícito que inclua kernel, stride, pooling e convenção de borda.
- **Comparação AE/VAE/DCN:** valores separados por 0,005 não autorizam escolher um vencedor sem repetição e incerteza; usar “desempenhos observados semelhantes”.

### Capítulo 6 — Detecção de novidade e mundo aberto

**Objetivos:** todos cumpridos como panorama conceitual.

**Achados:**

- **Definições:** a distinção entre mundo fechado, conjunto aberto e aprendizado de mundo aberto está clara e consistente.
- **Promessa de escolha:** “escolher entre” quatro escores e três algoritmos é mais forte que o conteúdo, que fornece propriedades gerais, mas não uma árvore de decisão ou exercício comparativo completo. Rebaixar o verbo para “comparar” ou incluir critérios operacionais explícitos.
- **Comparabilidade:** números antecipados de capítulos experimentais devem informar protocolo, conjunto e unidade; sem isso, `0,65` versus `0,87` parece uma comparação universal.
- **Risco de espaço aberto:** manter a formulação, mas evitar tratar qualquer classificador discriminativo como se produzisse necessariamente região positiva ilimitada; isso depende da função de decisão e da calibração.

### Capítulo 7 — O sistema dual

**Objetivos:** todos cumpridos. Os três casos reais prometidos aparecem na seção de estudos de caso ([cap07_dual.tex](../livro/capitulos/cap07_dual.tex#L389)).

**Achados:**

- **Erro numérico:** com decisão anômala apenas acima de $\mu+3\sigma$, a probabilidade gaussiana é $P(Z>3)\approx0,00135$, ou `0,135%`. `0,27%` é a probabilidade bilateral $P(|Z|>3)$; `0,3%` é arredondamento bilateral incompatível com o limiar unilateral ([cap07_dual.tex](../livro/capitulos/cap07_dual.tex#L244)).
- **Limiar heurístico:** o próprio capítulo admite não normalidade; reportar a taxa empírica de falso positivo no conjunto normal é mais útil que a taxa nominal.
- **Limiar de risco:** faixas 30/70% não têm derivação nem calibração descrita. Identificar explicitamente como regra operacional escolhida por especialistas ou apresentar curva custo-benefício.
- **Exagero de causalidade:** redução relativa de erro de 61% é aritmeticamente correta, mas a frase “três em cada cinco erros deixaram de ocorrer” pressupõe avaliações comparáveis e independência operacional; informar contagens e protocolo.
- **Reprodutibilidade:** implantação e estudos de caso privados precisam de protocolo mínimo auditável: período, número de alarmes, definição de verdade-terreno e adjudicação dos eventos.

### Capítulo 8 — Ensemble de classificadores binários

**Objetivos:** todos cumpridos.

**Achados:**

- **Comparação incompleta:** a tabela mostra `0,87` no OVA proposto contra `0,98` na literatura binária, mas o texto discute sobretudo o empate com o multiclasse interno. Explicar diferenças de split, classes, sensores, janelas e unidade de avaliação antes de chamar os métodos de comparáveis ([cap08_binarios.tex](../livro/capitulos/cap08_binarios.tex#L220)).
- **Exagero:** “rejeição gratuita” e “sem custo em acurácia” não seguem de `0,87` versus `0,86` sem intervalo/teste de equivalência ou não inferioridade ([cap08_binarios.tex](../livro/capitulos/cap08_binarios.tex#L258)). Melhor: “não se observou perda global relevante neste experimento”.
- **Heterogeneidade mascarada:** o empate global oculta diferenças de até 0,301 por classe. A conclusão deve reconhecer explicitamente esse custo redistributivo.
- **Hipótese pós-hoc:** associar vitórias por classe a assinaturas “próprias” é plausível, mas precisa ser apresentado como hipótese e testado por ablação/medida de separabilidade.

### Capítulo 9 — O ciclo de aprendizado de mundo aberto

**Objetivos:** todos cumpridos em descrição; a validade de uma tabela central precisa ser corrigida.

**Achados:**

- **Inconsistência numérica crítica:** se “acurácia 98,3%” significa acerto exato de $K$, apenas 1,7% dos casos têm erro. Para o MAE global ser 1,12, o erro absoluto médio nesses casos teria de ser
  $$\frac{1,12}{0,017}\approx65,9.$$
  Isso contradiz o próprio texto, que interpreta os erros como aproximadamente um grupo e considera cinco grupos intolerável ([cap09_mundoaberto.tex](../livro/capitulos/cap09_mundoaberto.tex#L360)). Verificar se a acurácia pertence a outra tarefa, se o MAE é `0,112`, se as métricas usam amostras diferentes ou se “acurácia” tem outra definição.
- **Vazamento metodológico possível:** explicar como as oito características usadas pela floresta são calculadas sem conhecer $K$. Silhueta, Davies-Bouldin, Calinski-Harabasz e inércia exigem uma partição candidata; o procedimento de geração dessas candidatas precisa estar completo.
- **Pesos por classe:** documentar como foram escolhidos os pesos do voto OVA/OCSVM e separar conjunto de calibração do teste.
- **Limiar adaptativo:** as faixas de $R$ e a salvaguarda de dois terços parecem heurísticas. Identificar sua origem e incluir ablação.
- **Boa prática:** a interpretação de 52% para ICV é equilibrada e evita vender o resultado como solução completa.

### Capítulo 10 — Superando o mundo fechado

**Objetivos:** todos cumpridos, com ressalva para custo computacional, cuja análise é breve.

**Achados:**

- **Alegação temporal simplificada:** comprimento de janela não é automaticamente igual a atraso de detecção; depende de alinhamento, passo, janela causal, aquecimento e frequência de inferência. A tabela deve dizer “histórico mínimo exigido” e declarar essas condições ([cap10_closedworld.tex](../livro/capitulos/cap10_closedworld.tex#L115)).
- **Comparação física:** a correlação de Motiee precisa informar unidades, domínio de validade e equação/página da fonte; coeficientes sem essas informações são difíceis de reproduzir.
- **Fonte a conferir:** a atribuição de 30 minutos a 5 horas a `VARGAS2019` não pôde ser confirmada pela página bibliográfica pública consultada. Verificar no texto integral e citar página/seção.
- **Incerteza:** o resultado de 89% para a classe escondida deve vir com $n$, intervalo e distribuição dos 11% restantes.
- **Interpretação:** a não monotonicidade com $T$ é bem tratada como hipótese, mas as causas propostas ainda não foram testadas; manter linguagem condicional.

### Capítulo 11 — Da detecção à segmentação

**Objetivos:** todos cumpridos.

**Achados:**

- **Comparação não controlada:** `0,500 → 0,863` compara detector por janela convertido para avaliação por amostra com segmentador supervisionado. Demonstra adequação à tarefa, não ganho isolado da arquitetura.
- **Exagero operacional:** a queda do desvio entre poços é útil, mas não torna por si só o sistema “implantável”; o pior IoU é 56% e a revocação SoftED global é 0,68 ([cap11_segmentacao.tex](../livro/capitulos/cap11_segmentacao.tex#L190), [cap11_segmentacao.tex](../livro/capitulos/cap11_segmentacao.tex#L254)).
- **Preferência de risco:** afirmar que falsos alarmes são preferíveis a eventos perdidos, ou vice-versa, depende da criticidade do evento. No texto atual, a preferência por precisão alta é generalizada sem matriz de custo por classe.
- **SoftED:** $k=1000$ corresponde a cerca de 16,7 minutos a 1 Hz, coerente com o capítulo 4. Justificar operacionalmente a tolerância e mostrar sensibilidade a outros valores.
- **Objetivo de diagnóstico de rótulo:** o caso A3 gera hipótese forte de anotação incorreta; sem revisão cega por especialista, chamar isso de diagnóstico é excessivo.

### Capítulo 12 — Novidade no espaço latente

**Objetivos:** todos cumpridos.

**Achados:**

- **Protocolo:** o capítulo informa que cada classe é removida do treinamento; portanto, os resultados por classe são um protocolo válido de classe escondida. A ICV é corretamente destacada como a única novidade externa ao 3W ([cap12_mahalanobis.tex](../livro/capitulos/cap12_mahalanobis.tex#L99)).
- **Inferência indevida:** melhorar em 9 de 10 linhas não é “assinatura de uma mudança correta de método e não de ajuste ao teste”. Uniformidade de resultado não exclui vazamento, seleção de hiperparâmetros ou ajuste ao benchmark ([cap12_mahalanobis.tex](../livro/capitulos/cap12_mahalanobis.tex#L139)).
- **Causalidade:** “a representação discriminativa supera porque foi treinada para separar” é mecanismo plausível, não demonstrado. Uma ablação deve separar arquitetura, dimensão, objetivo de treino e uso de rótulos.
- **Significância:** `0,691 ± 0,162` e `0,755 ± 0,171` não sustentam “diferença real” sem análise pareada.
- **Generalização:** desempenho em leave-one-class-out no 3W não autoriza generalização irrestrita a novidades fora da taxonomia; o resultado ICV é a evidência externa mais relevante e deve receber intervalo e descrição da amostra.

### Capítulo 13 — Modelos de linguagem como camada de raciocínio

**Objetivos:** todos cumpridos.

**Achados:**

- **Referência incompatível:** Qwen3.5-397B-A17B existe e a ficha oficial confirma 397B totais e 17B ativos. Porém, `Qwen2025` aponta para o *Qwen3 Technical Report*, que descreve a família Qwen3 até 235B, não o Qwen3.5. Adicionar a referência oficial Qwen3.5 de 2026 ([cap13_llm.tex](../livro/capitulos/cap13_llm.tex#L103), [referencias.bib](../livro/referencias.bib#L3577)).
- **Arredondamento:** `17/397 = 4,28%`; “aproximadamente 4%” é aceitável. Não é erro.
- **Exagero:** “modelo denso de 397B seria inviável” depende de hardware, quantização, paralelismo e requisito de latência. Usar “muito mais caro” ou definir o ambiente.
- **Reprodutibilidade:** registrar identificador exato do endpoint NIM, data, modo thinking/non-thinking, `top_p`, `top_k`, `max_tokens`, seed quando disponível e política de atualização. Temperatura 0,2 sozinha é insuficiente.

### Capítulo 14 — A camada de agente

**Objetivos:** todos cumpridos.

**Achados:**

- **Contagem correta, mas fácil de interpretar mal:** são 13 métricas por sensor e duas métricas entre sensores; a tabela do prompt esclarece isso ([cap14_agente.tex](../livro/capitulos/cap14_agente.tex#L198), [cap14_agente.tex](../livro/capitulos/cap14_agente.tex#L279)). Não há erro de 13 versus 14.
- **Erro herdado do capítulo 3:** z-score seguido de Min-Max é redundante se ajustado sobre os mesmos dados ([cap14_agente.tex](../livro/capitulos/cap14_agente.tex#L51)). Documentar escopo de ajuste ou simplificar.
- **Limiarização:** limites `0,5σ`, `z=1/3` e inclinações `0,002/0,01` são escolhas decisivas e não têm calibração ou unidade suficientemente descrita.
- **Wavelet:** a justificativa qualitativa de db4/nível 3 é razoável, mas não demonstra superioridade. Adicionar ablação e explicar frequências após a taxa de amostragem e eventual reamostragem.
- **Perfis de classe:** conhecimento de domínio redigido manualmente pode vazar o nome/assinatura esperada para a tarefa de “novidade”. Publicar os prompts completos e separar testes com e sem descrição nominal.

### Capítulo 15 — O que o agente acerta e o que não acerta

**Objetivos:** todos cumpridos.

**Achados:**

- **Inconsistência com capítulo 4:** tabelas por classe usam amostras de 14 a 36 e não apresentam IC, apesar da regra explícita de IC para toda proporção com $n<200$ ([cap15_resultados_agente.tex](../livro/capitulos/cap15_resultados_agente.tex#L106)).
- **Seleção de classes:** excluir 4 e 5 dos estudos 1 e 2 é justificável, mas altera a tarefa e impede ler `89,7%` como desempenho sobre as nove classes. A legenda e toda repetição do número devem dizer “sete classes não sintomáticas”.
- **Exagero causal:** desempenho baixo recorrente das classes 4 e 5 é evidência compatível com problema taxonômico, não “evidência mais forte de que o problema está na taxonomia”; também pode refletir dados, janela, rótulos ou representação.
- **Política operacional:** reduzir a fila em 59% com 9,1% de confirmações incorretas não é “risco controlado” sem custo por falso aceite e análise por gravidade.
- **Contaminação:** como o 3W é público e os perfis incluem conhecimento de domínio, os resultados do LLM devem ser descritos como zero-shot em exemplos, não necessariamente sem conhecimento prévio do conjunto.

### Capítulo 16 — Síntese

**Objetivos:** todos cumpridos como síntese narrativa; algumas conclusões excedem a evidência.

**Achados:**

- **Comparações não equivalentes:** a tabela de “saltos” reúne datasets, tarefas, unidades e protocolos diferentes. `52 → 98,2%` não isola apenas a troca de representação, e `0,500 → 0,863` também troca a tarefa/modelo/supervisão ([cap16_sintese.tex](../livro/capitulos/cap16_sintese.tex#L40)).
- **Exagero de implementação:** “trocar uma linha” minimiza a necessidade de treinar, versionar e validar a representação supervisionada.
- **Exagero causal:** “os dois maiores ganhos foram os mais baratos” exige custo medido em unidade comum; hoje custos são descritos qualitativamente.
- **Generalização indevida:** observar a mesma assimetria em duas famílias neste benchmark “sugere”, mas não demonstra, uma propriedade do problema ([cap16_sintese.tex](../livro/capitulos/cap16_sintese.tex#L180)). O capítulo 18 corretamente a reformula como questão de pesquisa.
- **Conflito de papéis:** chamar o agente de “decisor auxiliar” com 94,9% em uma classe de amostra pequena e possível confundimento contraria a regra anterior de que o LLM nunca decide. Usar “segunda opinião priorizada”.

### Capítulo 17 — Da bancada à plataforma

**Objetivos:** 4 cumpridos; 1 parcialmente cumprido.

**Achados:**

- **Objetivo não cumprido integralmente:** o capítulo promete “estimar o custo total”, mas a tabela informa tempo, memória e “custo por chamada”, sem volume, preço, moeda, horizonte, infraestrutura ou custo humano quantificado ([cap17_operacao.tex](../livro/capitulos/cap17_operacao.tex#L13), [cap17_operacao.tex](../livro/capitulos/cap17_operacao.tex#L277)).
- **Correção:** incluir uma equação de TCO e três cenários: segmentos/dia, tokens de entrada/saída, preço por milhão de tokens, GPU/serviço, armazenamento e horas de especialista.
- **Generalização de risco:** “três alarmes falsos por turno” e preferência por poucos falsos positivos precisam de contexto; em eventos de segurança, falso negativo pode dominar o custo.
- **Requisitos alegados versus implementados:** separar claramente recursos já implantados no sistema dual daqueles propostos para a arquitetura de referência ainda não avaliada fim a fim.

### Capítulo 18 — O que ainda não sabemos

**Objetivos:** todos cumpridos. É o capítulo mais cauteloso do manuscrito.

**Achados:**

- **Limitação crítica tardia:** o confundimento de telemetria afeta potencialmente capítulos 7–16, mas sua ressalva mais forte só aparece aqui ([cap18_futuro.tex](../livro/capitulos/cap18_futuro.tex#L24)). Repeti-la nos capítulos de dados, resultados e síntese.
- **Inconsistência de prioridade:** o texto chama medir confundimento de “primeira prioridade”, mas a tabela de agenda coloca a remoção do confundimento depois de ablação e métricas de localização. Reordenar.
- **Causalidade:** “nenhuma matriz de confusão revelou isso; foi necessário um sistema descrever” relata o caminho histórico, mas não prova necessidade metodológica. Uma auditoria explícita de missingness poderia revelar o mesmo artefato.
- **Agenda:** adicionar validação externa, revisão cega de rótulos por especialistas, baseline humana e análise de sensibilidade à procedência dos dados antes de otimizações arquiteturais.

## 4. Plano de correção

**Estado em 3 de setembro de 2026:** 13 ações concluídas, 5 mitigadas ou parcialmente
concluídas e 4 pendentes ou bloqueadas. A legenda abaixo distingue correção editorial de
reexecução experimental: **[concluída]**, **[parcial]** e **[pendente]**.

### Fase 0 — Bloqueadores de validade

1. **[parcial] Recalcular a tabela do estimador de $K$ no capítulo 9.** Os valores foram restaurados como publicados e a incompatibilidade foi demonstrada; confirmar definição, denominador e conjunto de teste requer os artefatos originais.
2. **[pendente] Executar o experimento de confundimento de telemetria.** Estratificar por classe e remover/mascarar janelas com zeros, ausências ou congelamento coincidentes com o rótulo; repetir resultados principais.
3. **[concluída] Corrigir as transformações de escala.** Especificar conjuntos de ajuste e demonstrar matematicamente a transformação usada; remover a dupla etapa quando redundante.
4. **[concluída] Corrigir MLP e $3\sigma$.** São alterações textuais pequenas e objetivas.

### Fase 1 — Estatística e protocolos

5. **[concluída]** Adicionar $n$ e IC de Wilson a todas as proporções com amostra pequena, ou remover a regra absoluta do capítulo 4. A política absoluta foi condicionada à disponibilidade das contagens.
6. **[parcial]** Para comparações sobre os mesmos casos, usar McNemar/bootstrap pareado; para equivalência, definir margem e teste de não inferioridade. O procedimento foi corrigido, mas os testes não podem ser recalculados sem predições pareadas.
7. **[parcial]** Identificar em cada tabela: versão do 3W, procedência das instâncias, sensores, janela, passo, split, seed/repetições e unidade de avaliação. O protocolo disponível foi consolidado no apêndice; metadados ausentes não foram inferidos.
8. **[concluída]** Separar resultados de sete classes dos resultados de nove classes e evitar “global” sem declarar o universo.
9. **[pendente]** Adicionar análise de sensibilidade para $k$ do SoftED, percentil de Mahalanobis, pesos OVA/OCSVM e limiares do agente.

### Fase 2 — Linguagem e causalidade

10. **[concluída]** Substituir “prova”, “assinatura de método correto”, “gratuito”, “implantável” e “propriedade do problema” por formulações condicionadas à evidência.
11. **[concluída]** Não apresentar mudanças simultâneas de tarefa, supervisão, dados e arquitetura como efeito causal de um único componente.
12. **[concluída]** Distinguir sempre: avaliação offline, estudo de classe escondida, novidade externa e implantação operacional.
13. **[concluída]** Antecipar a ressalva de telemetria nos capítulos 3, 12, 15 e 16. A ameaça à validade foi ligada explicitamente aos resultados afetados e priorizada no capítulo 18.

### Fase 3 — Fontes e reprodutibilidade

14. **[concluída]** Adicionar referência oficial de 2026 para Qwen3.5 e manter `Qwen2025` apenas para conceitos da geração Qwen3.
15. **[concluída]** Citar página/equação e unidades da correlação de Motiee; confirmar na fonte a faixa de 30 minutos a 5 horas. A faixa foi removida porque a fonte citada não a sustenta.
16. **[parcial]** Documentar endpoint/model ID, data, parâmetros completos e logs das chamadas ao LLM. Os parâmetros disponíveis foram registrados; endpoint, revisão e logs não constam das fontes do repositório.
17. **[parcial]** Para resultados privados, incluir ficha de evidência agregada: período, população, número de eventos, adjudicação e limitações de acesso. As limitações foram declaradas, mas os metadados agregados não estão disponíveis.
18. **[pendente]** Publicar tabelas derivadas em CSV ou script reproduzível para permitir checagem automática de aritmética.

### Fase 4 — Alinhamento pedagógico

19. **[concluída]** Trocar verbos de objetivos quando o capítulo apenas apresenta teoria: “construir/conduzir/projetar/estimar” por “descrever/calcular em exemplo/comparar”, ou adicionar prática executável que cumpra o verbo original.
20. **[concluída]** Incluir exemplo resolvido de NPT no capítulo 1 e TCO no capítulo 17.
21. **[pendente]** Criar ao fim de cada capítulo uma matriz curta “objetivo → seção/exercício”.
22. **[concluída]** Fazer revisão final das tabelas-resumo contra as tabelas-fonte para impedir deriva de números e escopo.

## 5. Critérios de aceite da próxima revisão

- A tabela de $K$ é aritmeticamente coerente e reproduzível.
- A cadeia de normalização possui definição inequívoca de `fit` e `transform`.
- Todas as proporções abaixo de 200 observações têm IC ou a política editorial foi reformulada.
- Toda comparação causal usa ablação/controlado ou linguagem observacional.
- Resultados sobre 7 classes não são descritos como resultados sobre 9.
- A ressalva de telemetria aparece junto aos resultados afetados.
- A versão exata do LLM e seus parâmetros estão citados e registrados.
- Os objetivos dos capítulos 1 e 17 são reduzidos ou recebem exemplos quantitativos completos.
- O livro continua compilando sem referências indefinidas.

## 6. Conclusão

O livro não apresenta um padrão generalizado de “alucinações”. O problema dominante é outro: conclusões plausíveis são, em alguns trechos, expressas com força causal ou universal maior que a permitida pelos experimentos. Há quatro correções objetivas urgentes e uma limitação experimental transversal — o confundimento de telemetria — que deve ser tratada antes de usar os resultados como evidência operacional ampla.

Com a correção da tabela de $K$, da matemática de pré-processamento, da explicação do MLP, da taxa de $3\sigma$ e com protocolos estatísticos mais uniformes, o manuscrito ganhará substancialmente em rigor sem precisar mudar sua arquitetura narrativa.

## 7. Estado da implementação

**Revisão implementada em 3 de setembro de 2026.** O manuscrito passou a 241 páginas e
foi recompilado com 0 erros, 0 referências indefinidas e 0 caixas overfull acima de
20 pt.

### Resolvido no texto

- Restaurada a tabela do estimador de $K$ como reprodução dos valores publicados em
  `Lopes2025EAAI`, com atribuição explícita e sem a interpretação conjunta
  aritmeticamente incompatível; os valores aguardam reconciliação com os artefatos
  originais.
- Corrigidas a dupla normalização, a explicação do MLP, a cauda unilateral de $3\sigma$
  e o campo receptivo da U-Net, agora calculado como 60 amostras.
- Comparações pareadas passaram a recomendar McNemar, bootstrap pareado e teste de não
  inferioridade; a política absoluta de IC foi condicionada à disponibilidade de
  contagens.
- Claims de gratuidade, causalidade, implantação e propriedade universal foram
  reescritos como resultados observacionais ou hipóteses testáveis.
- O resultado de novidade do agente passou a declarar explicitamente o universo de sete
  classes não sintomáticas.
- A correlação de Motiee passou a usar $\log_{10}$ da pressão em psia e saída em graus
  Fahrenheit; o exemplo foi recalculado e as páginas da fonte foram indicadas.
- Adicionada a ficha oficial do Qwen3.5-397B-A17B; incluídos exemplos resolvidos de NPT
  e TCO; a figura provisória recebeu nome semântico.
- A agenda futura agora coloca a avaliação do possível confundimento de telemetria em
  primeiro lugar.

### Mitigado, mas não resolvido experimentalmente

- O possível confundimento de telemetria foi antecipado e propagado como ressalva, mas
  sua magnitude continua desconhecida.
- Resultados privados e limiares operacionais foram delimitados como evidência não
  auditável ou não calibrada nesta edição.
- O apêndice de reprodução agora declara a ausência de scripts, sementes, ambientes
  congelados, tabelas derivadas e logs completos do serviço de linguagem.

### Bloqueado por artefatos ausentes

- Recalcular o estimador de $K$, intervalos por classe e testes pareados requer
  predições, contagens ou scripts que não estão no repositório.
- Quantificar confundimento, sensibilidade de limiares, ablações e baseline humana exige
  novas execuções experimentais.
- Confirmar desempenho industrial agregado exige ficha de evidência do operador; não se
  inferiram valores privados.
