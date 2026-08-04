# Livros de Mundo Aberto

**Um manifesto sobre publicar conhecimento sem pedir licença**

---

## Preâmbulo

Este livro trata de aprendizado de mundo aberto: a recusa de assumir que todas as
classes já são conhecidas. Um classificador de mundo fechado é aquele que, diante
de algo que nunca viu, insiste em encaixá-lo numa das gavetas que possui. Ele não
erra por ignorância — erra por arrogância estrutural. Foi construído para não
admitir que exista o que ele desconhece.

A forma como publicamos ciência opera sob a mesma premissa. O sistema editorial
assume que o conhecimento legítimo é aquele que passou pelos portões
reconhecidos. O que não passou não é classificado como *desconhecido*: é
classificado como *inexistente*.

Este documento propõe aplicar ao livro o mesmo princípio que o livro defende.

---

## I. Como o conhecimento foi cercado

A revista científica nasceu em 1665, com o *Philosophical Transactions* da Royal
Society, para resolver um problema real: registrar prioridade e fazer circular
resultados entre pares dispersos.

O que a transformou em negócio veio depois. Robert Maxwell, à frente da Pergamon
a partir de 1951, percebeu algo que os editores acadêmicos tradicionais não
tinham percebido: um artigo científico não tem substituto. Quem precisa daquele
resultado precisa daquele artigo. Não existe concorrência entre periódicos como
existe entre jornais. Cada revista é um monopólio sobre o que publicou.

Sobre essa constatação montou-se uma máquina com cinco falhas de mercado
empilhadas:

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
Onde antes se pagava para ler, hoje se paga para publicar, com taxas que chegam a
cifras de cinco dígitos por artigo. O paywall virou um pedágio na entrada.

E a armadilha é coletiva, não individual. Cada pesquisador, isolado, faz o que é
racional: submete onde pontua. A soma dessas decisões racionais sustenta o
sistema que quase todos consideram indefensável.

---

## II. A cerca menor: a formatação

Há uma segunda camada de custo, menos discutida porque parece trivial.

Normas de citação existem por uma razão que fazia sentido em 1906, quando o
*Chicago Manual of Style* nasceu como folha de estilo de uma gráfica: cada
decisão editorial custava tempo de um compositor humano manipulando tipos de
chumbo. Uma norma fixa eliminava deliberação.

A composição virou software. A norma sobreviveu.

Duas coisas seguem confundidas. **Os dados** de uma referência — autor, ano,
título, veículo, DOI — precisam de padronização rigorosa: sem campos
consistentes não existe grafo de citações, não existe rastreabilidade. Já **a
renderização** — se o sobrenome vai em versalete, se o título é itálico ou
aspas — é escolha tipográfica sem conteúdo informacional.

Quem usa BibTeX, CSL ou Quarto já resolveu isso: os dados ficam num arquivo, o
estilo é uma linha. Trocar de norma é editar um caractere e recompilar. O que
resta de sofrimento é falha de ferramenta e inércia institucional, não
necessidade conceitual.

No Brasil há um agravante com valor de símbolo: **as normas da ABNT são
vendidas**. A NBR 6023, a NBR 10520 e a NBR 14724 não são de acesso livre. O
estudante é obrigado a seguir uma regra que precisa comprar para ler. O padrão
que governa como a ciência brasileira é escrita está, ele próprio, atrás de um
paywall.

---

## III. O que se perdeu pelo caminho

Nada disso significa que o processo editorial seja vazio.

Duas funções são reais e vale nomeá-las antes de dispensá-las:

**Independência adversarial.** O valor de um parecer não está na competência do
parecerista, mas no fato de que ele não é o autor. Ninguém revisa o próprio texto
com honestidade — não por falta de rigor, mas porque lemos o que quisemos
escrever, não o que está na página. Isso vale para qualquer autor, em qualquer
nível.

**Responsabilidade assumida.** Um conselho editorial que aprova uma obra é um
terceiro colocando reputação em risco pela decisão.

O erro do sistema atual não é cobrar por essas funções. É que ele deixou de
executá-las e continuou cobrando — vendendo prestígio de marca no lugar de
avaliação, e cobrando duas vezes por trabalho que recebeu de graça.

Um livro que abre mão de editora precisa **substituir essas funções, não
ignorá-las**.

---

## IV. A alternativa

Três peças, todas gratuitas, todas com precedente estabelecido.

### GitHub — o processo

O texto-fonte fica versionado e público. Cada alteração tem autor, data e
justificativa. Qualquer leitor pode abrir uma *issue* apontando erro, lacuna ou
discordância — publicamente, de forma atribuível e permanente.

Isso não é improviso. É o procedimento formal de periódicos indexados: o *Journal
of Open Source Software* conduz toda a revisão por pares dentro de issues do
GitHub, com pareceres assinados e visíveis. O *ReScience C* faz o mesmo. O
*Distill* mudou o padrão da área operando assim.

E é como nasceram *Pro Git*, *Dive into Deep Learning*, *Mathematics for Machine
Learning*, *Probabilistic Machine Learning*, *R for Data Science*, *Crafting
Interpreters* e *Category Theory for Programmers* — vários deles depois impressos
por Cambridge, MIT Press e O'Reilly, sem jamais deixarem de estar livres.

### Zenodo — a permanência

Cada versão recebe um DOI próprio, com um DOI-conceito estável apontando sempre
para a mais recente. Infraestrutura do CERN, custeada publicamente, com
compromisso de preservação de longo prazo.

O *The Turing Way* — manual comunitário com centenas de colaboradores creditados
nominalmente, citado em políticas de agências de fomento — opera exatamente
assim: GitHub para o processo, Zenodo para o registro, CC BY para a licença.

O DOI também produz o que nenhuma tiragem de trezentos exemplares produz:
**evidência de uso**. Visualizações e downloads por versão, verificáveis por
terceiros. Um livro impresso não sabe se foi lido.

### ISBN próprio — a existência formal

Registrado diretamente na Fundação Biblioteca Nacional, sem custo. É o que faz a
obra existir para catálogos e sistemas de acervo.

Nenhuma ilusão sobre o que ele é: um ISBN **identifica**, não **chancela**. Não
carrega informação sobre mérito — não pode carregar. Quem o apresenta como aval
está mentindo, inclusive para si.

Mas custa nada, não impede nenhum caminho posterior, e completa a tríade.

### E a licença

CC BY 4.0. Irrevogável por desenho. Permite cópia, tradução, adaptação e uso
comercial, exigindo apenas atribuição.

Isto é deliberado e definitivo: uma vez aberto, não há como fechar. A licença
protege o leitor futuro inclusive contra o arrependimento do autor.

---

## V. O livro vivo

A revisão paga antes da publicação existe porque, no impresso, o erro é
permanente e caro. Mil exemplares errados são mil exemplares errados para sempre.
Comprava-se perfeição antecipada porque correção posterior era impossível.

Aqui um erro custa um *commit* e uma nova versão — que chega a todos os leitores,
imediatamente, com DOI próprio e preservando a anterior.

Isso não elimina o valor da revisão. **Muda quanto ela vale antecipadamente.**

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
   metadados abertos importam. Vírgulas e versaletes não.

4. **Revisão é necessária; monopólio sobre ela não é.** Substituímos o parecer
   fechado por revisão aberta, assinada, contínua e pública.

5. **Erro é estado, não pecado.** Publicamos sabendo que erramos, e nos obrigamos
   a corrigir à vista de todos.

6. **Uso demonstrável vale mais que selo.** Downloads, citações, *forks* e issues
   são evidência. Nome de editora é presunção.

7. **Aberto é irreversível.** Escolhemos licença que não permite recuar.

---

## VII. Sobre o pioneirismo — uma afirmação falsificável

Não encontramos precedente brasileiro de livro técnico-científico publicado
integralmente neste arranjo: fonte em repositório público, compilação
automatizada, DOI versionado no Zenodo, ISBN próprio e licença aberta
irrevogável, com revisão conduzida em aberto.

Fora do Brasil, o modelo está estabelecido há mais de uma década. Aqui, não
localizamos caso equivalente.

**Mas não afirmamos que não exista.**

Esta é precisamente a postura de mundo aberto: a ausência de observação não é
evidência de ausência. Um classificador honesto, diante de algo que não
reconhece, responde *desconhecido* — não *inexistente*.

Se você conhece um caso anterior, abra uma issue no repositório. Corrigiremos
esta seção nominalmente, com crédito. Um manifesto que não aceita ser corrigido é
exatamente o tipo de objeto que este manifesto rejeita.

E vale registrar de onde vem a tradição: o Brasil e a América Latina construíram,
com a **SciELO** desde 1997 e com a **RedALyC**, a maior infraestrutura de acesso
aberto sem cobrança do mundo — publicação gratuita e leitura gratuita, custeadas
publicamente, décadas antes de a Europa descobrir o assunto. Publicar assim não é
excentricidade importada. É continuar o que já é nosso.

---

## VIII. Convite

Este livro está aberto para leitura, cópia, tradução, crítica e uso em sala de
aula, hoje, sem cadastro e sem pagamento.

Está igualmente aberto para conserto.

Se encontrar erro, obscuridade, lacuna ou afirmação mal sustentada, abra uma
issue. Contribuições substantivas são creditadas nominalmente — que é, afinal, a
única moeda com que a revisão por pares jamais foi paga.

Um livro fechado é uma fotografia. Um livro aberto é um organismo.

Escolhemos o segundo.

---

*Maceió, agosto de 2026*

*Este manifesto acompanha o livro **Aprendizado de Mundo Aberto em Poços de
Petróleo: da detecção baseada em regras à explicabilidade por agentes de
linguagem**, e está sob a mesma licença [CC BY 4.0](LICENSE.md).*

*Aberto a assinaturas. Para endossar, abra um pull request adicionando seu nome.*
