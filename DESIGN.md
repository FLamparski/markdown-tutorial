# Markdown Tutorial - Design

This is a markdown tutorial project for [Codinghorror's challenge][1] to create
a better tutorial for the language.

## The problem

> However, one thing I have really struggled with is that there isn't any single
> great place to refer people to with a simple walkthrough and
> explanation of Markdown.  
> _-- Jeff Attwood_

Most markdown documentation I found was actually just a language reference,
and often using a slightly different subset from what other sites are using.

## The contest

As a contest entry, this tutorial will have to primarily focus on
[CommonMark][2] features, however depending on parsers it may later also add
GitHub Flavoured Markdown and other dialects.

### Contest rules

* HTML + JavaScript
* Highly interactive
* CommonMark
* Scaling difficulty: from complete beginner "how do I bold" to tables and
footnotes to image links to examining the output of Markdown and embedded HTML

## The approach

* The tutorial should be user friendly (with gamification features?)
* Markdown syntax should be highlighted
* Markdown reference should be as complete as possible
* It should be possible to save the user's progress, optionally with
an anonymous server storage (or use their Drive account?)

## Usability and accessibility

It should be possible to use the page with only the keyboard, with clearly
indicated shortcuts and access keys. It should also be possible to navigate
the UI using the mouse or touchscreen. On narrower screens, the editor and the
preview pane will have to be merged into one reversible 'card'.

## Relevant art

* [TypeForm][3] for the visual style inspiration
* [Try Commonmark][4] for a reference implementation?
* [Material Design][5] for the overall feel for the application

## Lesson plan

### Beginner Tier

In theory this should cover the most commonly used subset of markdown.

1. **Hello, Markdown** -- should introduce the user to the concept that Markdown
is just a way to format text - basic stuff like paragraphs.
2. **Stand out** -- should cover the syntax for bolding and emphasis.
3. **Linking it** -- should cover link syntax using angle brackets and
`[name](url)`.
4. **Headline News** -- should cover headings.
5. **A picture is worth a thousand words** -- should cover inserting images into
the document.
6. **Check it twice** -- should cover basic ordered and unordered lists.
7. **Quote me on this** -- should cover blockquotes.
8. **10 PRINT HELLO** -- should cover inline and block code elements.

### Intermediate Tier

1. **Divide and Rule** -- should cover horizontal rules and their interactions
with other elements.
2. **The Great Escape** -- introduction to escape characters and what to escape.
3. **Link: see below** -- introduction to syntax for link references.
4. **Click the Fish to Win** -- should cover making image hyperlinks
5. **20 PRINT RAINBOW** -- code block info strings and code highlighters (note
that this is not explicitly part of the CommonMark spec)
6. **You won't believe those 6 weird lists!** -- should expand on lists,
including block elements in list items, nested mixed-type lists, etc.

### Advanced Tier

1. **Inline HTML** -- show how HTML can be mixed with Markdown
3. **What you see is not what you get** -- side-by-side comparison of the input
document, its HTML representation, and rendered version.
3. **The Mark of Babel** -- highlighting most popular markdown variants
    * GitHub Flavoured
    * Kramdown (Jekyll)
    * This should use BabelMark?
4. **Make it your own** -- A quick JS tutorial on using Marked

[1]: http://blog.codinghorror.com/toward-a-better-markdown-tutorial/
[2]: http://commonmark.org/
[3]: http://www.typeform.com/examples
[4]: http://spec.commonmark.org/dingus/
[5]: http://www.google.com/design/spec/material-design/introduction.html
