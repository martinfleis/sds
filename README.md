# Spatial Data Science for Social Geography

![SDS4SG](assets/logo.svg)

A repository hosting the course material for Spatial Data Science for Social Geography taught at Charles University in Prague.

> [!WARNING]
> This course material is currently under construction and is likely incomplete. The final
> version will be released in October 2023.

Spatial Data Science for Social Geography course introduces data science and computational analysis
using open source tools written in the Python programming language to the curriculum of
students of geography.

The course is taught in person at Charles University in Prague from October 2023 under the code MZ340V17.

## Aims

The module provides students with little or no prior knowledge of core competencies in Spatial Data Science (SDS). It includes:

- Advancing their statistical and numerical literacy.
- Introducing basic principles of programming and state-of-the-art computational tools for SDS.
- Presenting a comprehensive overview of the main methodologies available to the Spatial Data Scientist and their intuition on how and when they can be applied.
- Focusing on real-world applications of these techniques in a geographical and applied context.

> [!NOTE]
> **Is it only for social geography?**
>
> The course revolves around data typically used in social geography, but its applicability
> is not limited to social geography. In practice, you will work more with vector
> data than rasters (although we cover those a bit as well) and often with data capturing
> various aspects of human life. The spatial data science concepts, however, are universal.

## Learning outcomes

After finishing the course, students will be able to:

- Demonstrate understanding of advanced concepts of spatial data science and use the open tools to load and analyze spatial data.
- Understand the motivation and inner logic of the main methodological approaches of open SDS.
- Critically evaluate the suitability of a specific technique, what it can offer, and how it can help answer questions of interest.
- Apply several spatial analysis techniques and explain how to interpret the results in the process of turning data into information.
- Work independently using SDS tools to extract valuable insight when faced with a new dataset.

## Prerequisites

This course assumes an understanding of geography and its key concepts (e.g. coordinate
reference systems or the Modifiable Areal Unit Problem [@openshaw1983modifiable]), at
least basic familiarity with GIS (like file formats and basic spatial data manipulation)
and a basic understanding of statistics (e.g. understanding the concept of regression),
optimally with some spatial component (geographically weighted regression).
While the course will briefly explain these topics, it will not cover the theory and
statistics behind these concepts in detail.

No prior experience with programming or computer science is needed, although a positive
attitude towards these topics is necessary.

## Course structure

The material is planned for 12 weeks, with one session per week. Each session
is divided into three parts - _Concepts_, _Hands-on_ and _Exercise_, following the model
proposed by @darribas_gds_course. _Concepts_ have a form of a lecture covering conceptual
aspects of the day's topic, providing necessary theoretical background before digging into code. This part can be nicknamed ["I do"]{.accent}.
_Hands-on_ contains documented code in a Jupyter notebook, executed in
parallel by a lecturer, providing an additional explanation, and by students. Therefore, we have a part ["We do"]{.accent}.
_Exercise_ is a set of tasks to be performed by students individually, with
occasional guidance by the lecturer. So we finish the day with ["You do"]{.accent}.

For enrolled students of Charles University, the course will finish with a written
assignment in the form of a computational essay. See the
[Assignment](chapter_00/assignment.qmd) section for details.

## Literature

The course loosely follows the contents of the **Geographic Data Science with Python**
by Rey, Arribas-Bel and Wolf. The online version of the book is available under open access
from [geographicdata.science/book](https://geographicdata.science/book). Using the online
version over the printed one is recommended, although this is entirely up to you.

> [!NOTE]
> **Spatial or geographic data science?**
>
> Spatial data science and geographic data science are often treated as synonyms. In some
> interpretations, _spatial_ is broader than _geographic_. In this case, we do _spatial [...]
> for [...] geography_, which is, in principle, geographic data science. We will treat
> both terms as equal within the context of this course.

## Acknowledgements

The course material is partially derived from
[_A Course on Geographic Data Science_](https://darribas.org/gds_course/) by
Dani Arribas-Bel and follows its structure, main learning logic, and some
hands-on materials. Thanks, [Dani](https://darribas.org)! A few sections are derived
from other sources acknowledged at the bottom of respective pages. Thank you all!
