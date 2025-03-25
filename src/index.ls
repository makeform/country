module.exports =
  pkg:
    extend: name: \@makeform/choice, dom: \overwrite
    i18n:
      en: {
        search: "Search ..."
        close: "Close"
        reset: "Reset"
      } <<< Object.fromEntries(country-list.map (o) -> [o.1, o.3])
      "zh-TW": {
        search: "搜尋 ..."
        close: "關閉"
        reset: "重設"
      } <<< Object.fromEntries(country-list.map (o) -> [o.1, o.2])
  init: ({root, pubsub}) ->
    pubsub.fire \init.choice, do
      config:
        values: country-list.map (o) -> value: o.1, label: o.1, keyword: [o.1, o.2, o.3].join(' ')
        other: enabled: true, editable: true
