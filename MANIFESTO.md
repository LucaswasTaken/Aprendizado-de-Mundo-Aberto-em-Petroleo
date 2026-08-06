# Livros de Mundo Aberto

**Um manifesto sobre publicar conhecimento sem pedir licença**

---

## Preâmbulo

Este livro trata de aprendizado de mundo aberto: a recusa de assumir que todas as
classes já são conhecidas. Um classificador de mundo fechado, diante de algo que
nunca viu, insiste em encaixá-lo numa das gavetas que possui. Ele não erra por
ignorância — erra por arrogância estrutural.

A forma como publicamos ciência opera sob a mesma premissa. O que não passou
pelos portões reconhecidos não é classificado como *desconhecido*: é classificado
como *inexistente*.

Este documento aplica ao livro o mesmo princípio que o livro defende.

---

## I. Como o conhecimento foi cercado

A revista científica nasceu em 1665 para registrar prioridade e fazer circular
resultados entre pares dispersos. O que a transformou em negócio veio depois,
quando se percebeu que um artigo científico não tem substituto: não há
concorrência entre periódicos como há entre jornais, e cada revista é um
monopólio sobre o que publicou.

Sobre essa constatação empilharam-se cinco falhas de mercado:

1. **Monopólio por artigo.** Não há produto equivalente.
2. **Quem compra não é quem lê.** A biblioteca paga; o pesquisador consome. A
   sensibilidade a preço desaparece.
3. **O trabalho é doado.** Pesquisa, redação, revisão por pares e edição
   científica são feitas de graça — geralmente com financiamento público.
4. **O que se compra é prestígio, não conteúdo.** Publica-se onde conta para a
   carreira, não onde o texto seria mais lido.
5. **Venda casada.** Os *big deals* obrigam a assinar centenas de títulos
   irrelevantes para ter os poucos indispensáveis.

O resultado é uma indústria com margens de lucro de 30% a 40% — superiores às da
maioria das empresas de tecnologia — construída inteiramente sobre trabalho que
não pagou e sobre pesquisa que não financiou.

O acesso aberto por APC não desfez o arranjo: apenas mudou o ponto de cobrança.
Onde antes se pagava para ler, hoje se paga para publicar, com taxas de cinco
dígitos por artigo. O paywall virou pedágio na entrada.

E a armadilha é coletiva, não individual. Cada pesquisador, isolado, faz o que é
racional: submete onde pontua. A soma dessas decisões racionais sustenta o
sistema que quase todos consideram indefensável.

---

## II. A cerca menor: a forma imposta

Há uma segunda camada de custo, menos discutida porque parece trivial. Ela não se
resume a citação.

**A citação é a parte pequena.** Normas de estilo nasceram como folhas de
instrução de gráfica, quando cada decisão editorial custava tempo de um
compositor humano manipulando tipos de chumbo. A composição virou software; a
norma sobreviveu. Duas coisas seguem confundidas: **os dados** de uma referência
— autor, ano, título, veículo, DOI — exigem padronização rigorosa, porque sem
campos consistentes não há grafo de citações nem rastreabilidade; já **a
renderização** — se o sobrenome vai em versalete, se o título é itálico ou aspas
— é escolha tipográfica sem conteúdo informacional. Quem usa BibTeX, CSL ou
Quarto já resolveu isso: trocar de norma é editar uma linha e recompilar.

**A parte grande é a diagramação compulsória.** Exige-se do autor que ele mesmo
componha a obra segundo um padrão visual arbitrário — margens, fontes,
espaçamento, numeração, posição de legendas, paginação dos elementos pré-textuais
— ou que **pague um serviço de diagramação** para fazê-lo. Nos dois casos,
gasta-se tempo ou dinheiro para produzir *zero* informação nova. O trabalho não
esclarece nada: apenas transporta um conteúdo já pronto para um molde que ninguém
pediu e que nenhum leitor jamais reivindicou.

Isso seria defensável se o autor não tivesse alternativa. Mas tem. Ferramentas de
composição programável — LaTeX, Quarto, Typst — deixam quem escreve decidir *como*
o conteúdo aparece, e essa decisão é parte do argumento: onde cabe uma figura
colorida, onde cabe uma tabela larga, onde cabe um bloco de código executável,
onde cabe um destaque, o que fica junto na mesma página. Um padrão fixo não sabe
nada sobre o que está sendo explicado e frequentemente atrapalha: proíbe cor
porque a impressão custa caro, exige tabela onde um gráfico comunicaria melhor,
quebra uma demonstração ao meio para respeitar uma regra de paginação.

A norma resolve um problema de gráfica de 1906 e cobra do autor, hoje, o preço de
um problema que não existe mais.

No Brasil há um agravante com valor de símbolo: **as normas da ABNT são
vendidas**. A NBR 6023, a NBR 10520 e a NBR 14724 não são de acesso livre. O
estudante é obrigado a seguir — e a diagramar conforme — uma regra que precisa
comprar para ler. O padrão que governa como a ciência brasileira é escrita está,
ele próprio, atrás de um paywall.

---

## III. O que se perdeu pelo caminho

Nada disso significa que o processo editorial seja vazio. Duas funções são reais,
e vale nomeá-las antes de dispensá-las:

**Independência adversarial.** O valor de um parecer não está na competência do
parecerista, mas no fato de que ele não é o autor. Ninguém revisa o próprio texto
com honestidade — não por falta de rigor, mas porque lemos o que quisemos
escrever, não o que está na página.

**Responsabilidade assumida.** Um conselho editorial que aprova uma obra é um
terceiro colocando reputação em risco pela decisão.

O erro do sistema atual não é cobrar por essas funções. É que ele deixou de
executá-las e continuou cobrando — vendendo prestígio de marca no lugar de
avaliação. Um livro que abre mão de editora precisa **substituir essas funções,
não ignorá-las**.

---

## IV. A alternativa

Três peças, todas gratuitas, todas com precedente estabelecido.

**GitHub — o processo.** O texto-fonte fica versionado e público; cada alteração
tem autor, data e justificativa; qualquer leitor abre uma *issue* apontando erro,
lacuna ou discordância, de forma atribuível e permanente. Não é improviso: o
*Journal of Open Source Software* e o *ReScience C* conduzem toda a revisão por
pares dentro de issues do GitHub, com pareceres assinados e visíveis. E é como
nasceram *Pro Git*, *Dive into Deep Learning*, *Mathematics for Machine
Learning*, *R for Data Science* e *Crafting Interpreters* — vários deles depois
impressos por Cambridge, MIT Press e O'Reilly, sem jamais deixarem de estar
livres.

**Zenodo — a permanência.** Cada versão recebe um DOI próprio, com um
DOI-conceito estável apontando sempre para a mais recente. Infraestrutura do
CERN, custeada publicamente, com compromisso de preservação de longo prazo. É
assim que opera o *The Turing Way*. O DOI também produz o que nenhuma tiragem de
trezentos exemplares produz: **evidência de uso**, verificável por terceiros. Um
livro impresso não sabe se foi lido.

**ISBN próprio — a existência formal.** Registrado diretamente na Fundação
Biblioteca Nacional, sem custo. É o que faz a obra existir para catálogos e
sistemas de acervo. Sem ilusão sobre o que ele é: um ISBN **identifica**, não
**chancela**. Quem o apresenta como aval está mentindo, inclusive para si.

**A licença: CC BY 4.0.** Irrevogável por desenho. Permite cópia, tradução,
adaptação e uso comercial, exigindo apenas atribuição. Uma vez aberto, não há
como fechar — a licença protege o leitor futuro inclusive contra o arrependimento
do autor.

---

## V. O livro vivo

A revisão paga antes da publicação existe porque, no impresso, o erro é
permanente e caro. Mil exemplares errados são mil exemplares errados para sempre.
Comprava-se perfeição antecipada porque correção posterior era impossível.

Aqui um erro custa um *commit* e uma nova versão — que chega a todos os leitores
imediatamente, com DOI próprio e preservando a anterior. Isso não elimina o valor
da revisão: **muda quanto ela vale antecipadamente.**

Um livro de mundo aberto é, portanto:

- **Versionado** — `v1.0.0`, `v1.1.0`, cada uma citável e permanente
- **Corrigível** — errata deixa de ser vergonha e vira funcionamento normal
- **Auditável** — todo o histórico de decisões é público
- **Reprodutível** — o código que gerou as figuras acompanha o texto
- **Colorido** — sem restrição de custo de impressão
- **Gratuito nas duas pontas** — para publicar e para ler
- **Atribuível** — quem contribui aparece pelo nome

A `v1.1.0` não é admissão de falha. É o produto da revisão.

---

## VI. O que declaramos

1. **Conhecimento produzido com dinheiro público pertence ao público.** Não é
   generosidade devolvê-lo; é obrigação.

2. **Pagar para publicar e pagar para ler são a mesma cerca**, movida de lugar.
   Rejeitamos as duas.

3. **Padronizamos dados, não aparência.** Identificadores estruturados e
   metadados abertos importam. Vírgulas, versaletes e margens não.

4. **A forma é do autor.** Quem escreve dispõe hoje de ferramentas para decidir
   como o conteúdo se apresenta, e essa decisão é parte da explicação.
   Diagramação compulsória — feita à mão ou paga a terceiros — é custo sem
   informação, imposto por um padrão que não sabe o que está sendo dito.

5. **Revisão é necessária; monopólio sobre ela não é.** Substituímos o parecer
   fechado por revisão aberta, assinada, contínua e pública.

6. **Erro é estado, não pecado.** Publicamos sabendo que erramos, e nos obrigamos
   a corrigir à vista de todos.

7. **Uso demonstrável vale mais que selo.** Downloads, citações, *forks* e issues
   são evidência. Nome de editora é presunção.

8. **Aberto é irreversível.** Escolhemos licença que não permite recuar.

---

## VII. Sobre o pioneirismo — uma afirmação falsificável

Não encontramos precedente brasileiro de livro técnico-científico publicado
integralmente neste arranjo: fonte em repositório público, compilação
automatizada, DOI versionado no Zenodo, ISBN próprio e licença aberta
irrevogável, com revisão conduzida em aberto. Fora do Brasil, o modelo está
estabelecido há mais de uma década.

**Mas não afirmamos que não exista.** Esta é precisamente a postura de mundo
aberto: a ausência de observação não é evidência de ausência. Se você conhece um
caso anterior, abra uma issue no repositório; corrigiremos esta seção
nominalmente, com crédito. Um manifesto que não aceita ser corrigido é exatamente
o tipo de objeto que este manifesto rejeita.

E vale registrar de onde vem a tradição: o Brasil e a América Latina construíram,
com a **SciELO** desde 1997 e com a **RedALyC**, a maior infraestrutura de acesso
aberto sem cobrança do mundo — publicação gratuita e leitura gratuita, custeadas
publicamente, décadas antes de a Europa descobrir o assunto. Publicar assim não é
excentricidade importada. É continuar o que já é nosso.

---

## VIII. Convite

Este livro está aberto para leitura, cópia, tradução, crítica e uso em sala de
aula, hoje, sem cadastro e sem pagamento. Está igualmente aberto para conserto.

Se encontrar erro, obscuridade, lacuna ou afirmação mal sustentada, abra uma
issue. Contribuições substantivas são creditadas nominalmente — que é, afinal, a
única moeda com que a revisão por pares jamais foi paga.

Um livro fechado é uma fotografia. Um livro aberto é um organismo. Escolhemos o
segundo.

---

*Maceió, agosto de 2026*

*Este manifesto acompanha o livro **Aprendizado de Mundo Aberto em Poços de
Petróleo: da detecção baseada em regras à explicabilidade por agentes de
linguagem**, e está sob a mesma licença [CC BY 4.0](LICENSE.md).*

*Aberto a assinaturas. Para endossar, abra um pull request adicionando seu nome.*
