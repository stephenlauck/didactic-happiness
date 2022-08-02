# didactic-happiness - Policy Driven Automation

## Nix 

### render spells to script

`curl -X POST spellcaster.sh --data-binary @spells/nix.graphql > scripts/nix.sh`

### install and attestion

If you have the the script in the local context you want to manage:

`bash scripts/nix.sh`

If you prefer to have a ubiquitously available url to pull the script from:

`curl https://raw.githubusercontent.com/stephenlauck/didactic-happiness/main/scripts/nix.sh | bash`

### implicit policy that could become more explicit

    * ubuntu jammy
    * bash
    * x86_64-linux