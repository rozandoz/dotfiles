If ($PSVersionTable.PSVersion.Major -Le 5 -Or $isWindows) {

    # Create symlink for nvim config
    $nvimConfigPath = "AppData/Local/nvim"
    If (-Not (Test-Path $nvimConfigPath)) {
        New-Item -Path $nvimConfigPath -ItemType Junction -Value .config/nvim
    }
}
