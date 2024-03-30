Import-Module PSReadLine
Import-Module posh-git
Import-Module ZLocation


Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{ InlinePrediction = '#875f5f'}

Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord "Ctrl+e" -Function ViEditVisually


function lf_cd {
    lf -print-last-dir $args | Set-Location
}

function ls_b {
    eza --icons $args
}

function ll_b {
    ls_b -l $args
}

function la_b {
    ls_b -la $args
}

function l_b {
    ls_b -lagh $args
}

function cat_b {
    bat --color=always $args
}

Set-PSReadLineKeyHandler Ctrl+o {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("lf_cd")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}


[Environment]::SetEnvironmentVariable('EDITOR','nvim')
[Environment]::SetEnvironmentVariable('BAT_THEME','gruvbox-dark')


Set-Alias -Name ls -Value ls_b -Option AllScope
Set-Alias -Name ll -Value ll_b -Option AllScope
Set-Alias -Name la -Value la_b -Option AllScope
Set-Alias -Name l -Value l_b -Option AllScope
Set-Alias -Name cat -Value cat_b -Option AllScope
Set-Alias -Name lg -Value lazygit -Option AllScope

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/atomic.omp.json" | Invoke-Expression
