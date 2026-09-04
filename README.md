# Aprendizado de Mundo Aberto em Poços de Petróleo

**Da detecção baseada em regras à explicabilidade por agentes de linguagem**

Lucas Gouveia Omena Lopes · Thales Miranda de Almeida Vieira · Eduardo Toledo de Lima Junior · William Wagner Matos Lira · Pedro Esteves Aranha · Ricardo Emanuel Vaz Vargas

Laboratório de Computação Científica e Visualização — Universidade Federal de Alagoas · Petrobras

[![Licença: CC BY 4.0](https://img.shields.io/badge/licen%C3%A7a-CC%20BY%204.0-blue.svg)](LICENSE.md)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.22306796.svg)](https://doi.org/10.5281/zenodo.22306796)

### ➜ **[Ler o livro (PDF, 249 páginas)](dist/Aprendizado-de-Mundo-Aberto-em-Petroleo.pdf)**

**ISBN:** 978-65-02-28836-8 · **DOI:** [10.5281/zenodo.22306796](https://doi.org/10.5281/zenodo.22306796)

[Ficha catalográfica (PDF)](livro/editorial/ficha-catalografica.pdf) ·
[Manifesto (PDF)](livro/editorial/manifesto.pdf) · [Manifesto (fonte)](livro/editorial/manifesto.md)

---

## O que é este livro

Um livro em português sobre detecção, segmentação e explicação de eventos indesejáveis em
poços de petróleo. Ele não é uma coletânea de métodos: é a narrativa de um problema sendo
atacado por sucessivas aproximações ao longo de vários anos, e do que cada aproximação
revelou sobre a anterior.

O fio condutor é a passagem de três hipóteses que a prática desmente:

1. que o conjunto de classes conhecidas é fechado;
2. que detectar um evento é o mesmo que localizá-lo no tempo;
3. que uma decisão correta sem justificativa é uma decisão utilizável.

**249 páginas · 18 capítulos em cinco partes · cinco apêndices.**

| Parte | Conteúdo |
|---|---|
| I — Fundamentos | Domínio, dados, aprendizado, redes profundas e detecção de novidades |
| II — A base | Sistema dual em operação, ensemble binário e aprendizado de mundo aberto |
| III — A evolução | Classificação em mundo fechado, segmentação com U-Net e distância de Mahalanobis no espaço latente |
| IV — A explicabilidade | Modelos de linguagem, o agente de diagnóstico e seus resultados |
| V — Síntese e prática | Arquitetura de referência, requisitos de operação e agenda de pesquisa |

Os apêndices reúnem glossário, notação, formulário, condições de reprodução e um roteiro
prático executável.

## Baixar

O PDF compilado está versionado em
[`dist/Aprendizado-de-Mundo-Aberto-em-Petroleo.pdf`](dist/Aprendizado-de-Mundo-Aberto-em-Petroleo.pdf)
e é anexado a cada *release*. O GitHub abre o arquivo em um visualizador embutido; para
baixar, use o botão *Download raw file*.

## Código de apoio

O **Apêndice E** mapeia cada conceito da Parte I a cadernos Jupyter executáveis do
recurso *Introduction to Machine Learning Applied to Multivariate Time Series*, que
integra o repositório oficial do projeto 3W:

- Repositório 3W — <https://github.com/petrobras/3W>
- Recurso didático — <https://github.com/petrobras/3W/tree/main/resources/introduction_to_ml_applied_to_mts>

| Caderno | Capítulos exercitados |
|---|---|
| `1_data_treatment` | Cap. 3 — janelamento, escalonamento, validação cruzada |
| `2_visualization_techniques` | Caps. 3 e 6 — t-SNE, UMAP e as ressalvas sobre projeções |
| `3_introduction_to_unsupervised_learning` | Caps. 5, 6 e 7 — autoencoder LSTM, limiar, OCSVM |
| `4_introduction_to_supervised_learning` | Caps. 4 e 8 — árvores, SVM, MLP, métricas |
| `5_clustering_methods` | Caps. 6 e 9 — K-médias, DBSCAN, MeanShift, silhueta, ARI |

## Compilar a partir do fonte

Requer uma distribuição TeX completa (TeX Live ou MiKTeX) com `pdflatex`, `bibtex` e
`makeindex`.

```powershell
# Windows / PowerShell
.\scripts\build.ps1
```

```bash
# Linux / macOS
make -f scripts/Makefile
```

Ou diretamente:

```bash
latexmk -pdf -outdir=build livro/main.tex
```

### Estrutura

```
livro/main.tex          documento principal, partes e apêndices
livro/preambulo.tex     pacotes, ambientes e macros
livro/referencias.bib   bibliografia (233 entradas)
livro/frontmatter/      prefácio, guia de leitura, siglas e notação
livro/capitulos/        capítulos 1 a 18
livro/apendices/        glossário, notação, formulário, reprodução e prática
livro/figuras/          figuras usadas no livro
livro/editorial/        ficha catalográfica e manifesto
scripts/                comandos de compilação para Windows, Linux e macOS
dist/                   PDF final versionado
docs/                   créditos de figuras e relatório de revisão
build/                  artefatos locais de compilação (ignorado pelo Git)
```

## Como citar

Use o arquivo [`CITATION.cff`](CITATION.cff) — o GitHub oferece a citação formatada no
botão *Cite this repository*. Esta edição está identificada pelo DOI
[10.5281/zenodo.22306796](https://doi.org/10.5281/zenodo.22306796) e pelo ISBN
978-65-02-28836-8.

## Licença

Texto, figuras originais e fonte LaTeX sob [CC BY 4.0](LICENSE.md).

> **Atenção:** parte das figuras deriva de artigos publicados em periódicos e
> conferências com regimes de direito autoral distintos (SPE, Elsevier, Taylor & Francis,
> OTC). A licença CC BY 4.0 não se estende a esse material. O inventário figura a figura
> está em [`docs/creditos-figuras.md`](docs/creditos-figuras.md); consulte-o antes de redistribuir
> figuras específicas.

Os dados proprietários de poços usados em parte dos estudos de caso não são distribuídos
com a obra. O conjunto 3W é público e distribuído pela Petrobras.

## Arquivamento no Zenodo

Esta edição está preservada no Zenodo sob o DOI
[10.5281/zenodo.22306796](https://doi.org/10.5281/zenodo.22306796). O arquivo
[`.zenodo.json`](.zenodo.json) mantém os metadados usados no depósito.
