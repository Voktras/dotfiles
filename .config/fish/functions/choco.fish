function choco
  if test (count $argv) -gt 0
    switch $argv[1]
      case install
        set args $argv[2..-1]
        sudo pacman -S $args

      case uninstall remove
        set args $argv[2..-1]
        sudo pacman -Rns $args

      case update upgrade
        sudo pacman -Syu

      case search
        set args $argv[2..-1]
        pacman -Ss $args

      case list
        pacman -Q

      case '*'
        echo "Error: unknown command '$argv[1]'"
        echo "Usage: choco install|uninstall|update|search|list"
    end
  else
    echo "Using choco: install|uninstall|update|search|list"
  end
end

