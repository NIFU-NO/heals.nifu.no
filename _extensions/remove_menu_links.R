fs::dir_ls(path = "_site", type = "file", regexp = "\\.html", recurse = TRUE) |>
    purrr::map_chr(.f = ~ {
        readr::read_file(.x) |>
            stringr::str_replace_all(pattern = "<li>\n.+\n.+Epost:.+\n +</li> +\n", replacement = "") |>
            stringr::str_replace_all(pattern = '<li class="sidebar-item">\n.+\n.+\n.+Epost:.+\n.+\n</li>\n', replacement = "") |>
            readr::write_file(.x)
    })
