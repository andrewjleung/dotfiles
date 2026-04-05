return {
    {
        "saghen/blink.cmp",
        opts = {
            signature = {
                enabled = true,
                window = {
                    border = "rounded",
                },
            },
            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "kind_icon", "label", "label_description", gap = 1 },
                            { "kind", "source_name", gap = 1 },
                        },
                    },
                    border = "rounded",
                },
            },
        },
    },
}
