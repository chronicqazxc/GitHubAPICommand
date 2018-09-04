# Sometimes its a README fix, or something like that - which isn't relevant for
# including in a CHANGELOG for example
has_app_changes = !git.modified_files.grep(/lib/).empty?

# Warn no CHANGELOG
warn("No CHANGELOG changes made") if git.lines_of_code > 50 && !git.modified_files.include?("CHANGELOG.md") && !declared_trivial

# Add a CHANGELOG entry for app changes
if !git.modified_files.include?("CHANGELOG.md") && has_app_changes
    fail("Please include a CHANGELOG entry.")
    message "Note, we hard-wrap at 80 chars and use 2 spaces after the last line."
end

# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Warn summary on pull request
if github.pr_body.length < 5
    warn "Please provide a summary in the Pull Request description"
end
