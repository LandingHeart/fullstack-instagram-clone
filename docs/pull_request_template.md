**Status**

NOT READY

**Description**

Please include a 2 sentence summary.

#### Deploy pr below

**Change Logs**
copy to chrome console and paste it here for deployment pr

```js
copy(
  $$(".js-details-container.Details .issue-link.js-issue-link")
    .map((i) => {
      return `- ${i.innerHTML}`;
    })
    .join("\n")
);
```
