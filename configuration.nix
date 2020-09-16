
{
  inputs.lightmeter = { type = "github"; owner = "ngi-nix"; repo = "lightmeter"; };
  outputs = { self, nixpkgs, ... }@inputs:


  nixosConfigurations.<name> = nixpkgs.lib.nixosSystem {
    system = "<system>";
    modules = [
      ({ ... }: {
        imports = builtins.attrValues inputs.lightmeter.nixosModules;
        nixpkgs.overlays = [ inputs.lightmeter.overlay ];
        services.lightmeter.enable = true;
        services.lightmeter.flags.watch_dir = "/etc/postfix";
      })
    ];
  };
 
}
