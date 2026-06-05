#!/bin/bash

# Startar en loop för alla namn vi skickar med
for namn in "$@"
do
    # Skapar själva användaren i systemet
    useradd -m "$namn"

    # Skapar mapparna Documents, Downloads och Work
    mkdir -p /home/$namn/Documents /home/$namn/Downloads /home/$namn/Work

    # Skapar en välkomsttext i welcome.txt
    echo "Välkommen $namn" > /home/$namn/welcome.txt

    # Ändrar rättigheter så bara användaren kommer åt mapparna
    chmod 700 /home/$namn/Documents /home/$namn/Downloads /home/$namn/Work
    chown -R $namn:$namn /home/$namn
done
