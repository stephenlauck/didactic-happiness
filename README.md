# didactic-happiness - Policy Driven Automation

## Nix 

### render spells to script

`curl -X POST spellcaster.sh --data-binary @spells/nix.graphql > scripts/nix.sh`

### install and attestion

`bash scripts/nix.sh`

### implicit policy that could become more explicit

    * ubuntu jammy
    * bash
    * x86_64-linux