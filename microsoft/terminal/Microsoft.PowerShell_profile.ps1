fnm env --use-on-cd | Out-String | Invoke-Expression
oh-my-posh init pwsh --config "$env:LocalAPPDATA\Programs\oh-my-posh\themes\stelbent.minimal.omp.json" | Invoke-Expression

Import-Module posh-git
Import-Module PSReadLine
Import-Module -Name Terminal-Icons
# Import-Module PSColors # breaks oh-my-posh theme

# PSReadLine config
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Vi

Import-Module z

if ($env:TERM_PROGRAM -eq "vscode") {
  Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardKillWord
}

# source https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#powershell
# PowerShell parameter completion shim for the dotnet CLI
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

# source https://github.com/microsoft/winget-cli/blob/master/doc/Completion.md?WT.mc_id=-blog-scottha#powershell
# Winget Autocomplete
Register-ArgumentCompleter -Native -CommandName winget -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        [Console]::InputEncoding = [Console]::OutputEncoding = $OutputEncoding = [System.Text.Utf8Encoding]::new()
        $Local:word = $wordToComplete.Replace('"', '""')
        $Local:ast = $commandAst.ToString().Replace('"', '""')
        winget complete --word="$Local:word" --commandline "$Local:ast" --position $cursorPosition | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}