---
title: Python debugerio PDB autocompletion
category: atviras-kodas
image: i/placeholder.jpg
description: PDB autocompletion Python programavimo kalbai. Saugo brangų laiką kai nereikia rašyti daug bereikalingų komandų.
---

Sunkiai savo programavimą Python kalba įsivaizduočiau be seno gero `pdb`, kaip ir PHP kalboje be `xdebug`. Daug laiko susitaupo kai komplikuotą kodo vietą galima taip sakant „padebuginti“. Tiesa, kiek teko pastebėti, tai daug kas nežino, jog šis įrankis gali ištiesti dar ir papildomą pagalbos ranką leisdamas panaudoti tabuliacijos simbolį „autocompletionui“.Įjungti šią galimybę galima įrašius į failą ~/.pdbrc tokį turinį:```
    import rlcompleter
    pdb.Pdb.complete=rlcompleter.Completer(locals()).complete
```Šį modulį rasite tiek Python 2, tiek Python 3 versijose. Ir viskas!Aišku, jeigu tenka labai daug „debugintis“, tai galbūt verta pagalvoti apie kažką panašaus kaip [pudb modulį](https://pypi.python.org/pypi/pudb)?
