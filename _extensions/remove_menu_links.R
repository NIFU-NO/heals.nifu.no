fs::dir_ls(path = "_site", type = "file", regexp = "\\.html", recurse = TRUE) |>
    stringr::str_subset(pattern = "-NIFU-R91188BK.*\\.html") |>
    fs::file_delete()

Sys.sleep(30)
fs::dir_ls(path = "_site", type = "file", regexp = "\\.html", recurse = TRUE) |>
    purrr::walk(.f = ~ {
        readr::read_file(.x) |>
            stringr::str_replace_all(pattern = "<li>\n.+\n.+Epost:.+\n *</li> *\n", replacement = "") |>
            stringr::str_replace_all(pattern = '<li class="sidebar-item">\n.+\n.+\n.+Epost:.+\n.+\n</li>\n', replacement = "") |>
            readr::write_file(.x)
    })
cli::cli_inform("Done post-processing!")
