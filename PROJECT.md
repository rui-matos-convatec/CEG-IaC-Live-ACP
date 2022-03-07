# README
<img alt="ConvaTec" src="https://upload.wikimedia.org/wikipedia/en/4/4c/ConvaTec_logo.svg">   <img alt="Terraform" src="https://www.datocms-assets.com/2885/1629941242-logo-terraform-main.svg" width="200px">

Enter README text here
---
[![This is the CHANGELOG][changelog-badge]][changelog] [![This is the LICENSE file][license-badge]][license]

*Disable Zscaler if installed to avoid getting errors like this:*
```
╷
│ Error: Failed to query available provider packages
│
│ Could not retrieve the list of available versions for provider hashicorp/local: could not connect to registry.terraform.io: Failed to request discovery
│ document: Get "https://registry.terraform.io/.well-known/terraform.json": x509: certificate signed by unknown authority
╵
```

### Heading

# H1
## H2
### H3

### Bold

**bold text**

### Italic

*italicized text*

### Blockquote

> blockquote

### Ordered List

1. First item
2. Second item
3. Third item

### Unordered List

- First item
- Second item
- Third item

### Code

`code`

### Horizontal Rule

---

### Link

[Markdown Guide](https://www.markdownguide.org)

### Image

![alt text](https://www.markdownguide.org/assets/images/tux.png)

## Extended Syntax

These elements extend the basic syntax by adding additional features. Not all Markdown applications support these elements.

### Table

| Syntax | Description |
| ----------- | ----------- |
| Header | Title |
| Paragraph | Text |

### Fenced Code Block

```
{
  "firstName": "John",
  "lastName": "Smith",
  "age": 25
}
```

### Footnote

Here's a sentence with a footnote. [^1]

[^1]: This is the footnote.

### Heading ID

### My Great Heading {#custom-id}

### Definition List

term
: definition

### Strikethrough

~~The world is flat.~~

### Task List

- [x] Write the press release
- [ ] Update the website
- [ ] Contact the media


[changelog]: ./CHANGELOG.md
[readme]: ./README.md
[changelog-badge]: https://img.shields.io/badge/CHANGELOG-Check%20CHANGELOG%20for%20changes-%23E05735
[readme-badge]: https://img.shields.io/badge/README-Check%20README%20file%20for%20project%20information-brightgreen
[license]: ./LICENSE
[license-badge]: https://img.shields.io/badge/LICENSE-%40ConvaTec%20UNLICENSED%20and%20PRIVATE%20USAGE%20ONLY-blue
