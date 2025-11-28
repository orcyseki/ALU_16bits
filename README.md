
Ce projet implémente une ALU (Arithmetic Logic Unit) 16 bits en VHDL, conçue pour être modulaire et extensible.

Fonctionnalités principales :


- Opérations arithmétiques : addition, soustraction, multiplication, division.

- Opérations logiques : AND, OR, XOR, NOT.

- Drapeaux : cout pour la retenue et zero pour indiquer un résultat nul.

- Multiplexeur sel pour sélectionner l’opération souhaitée.


Tous les blocs (adder, sub, mult, div) sont instanciés comme composants séparés, facilitant la simulation et la maintenance.

Testbench inclus pour vérifier toutes les opérations et drapeaux.
