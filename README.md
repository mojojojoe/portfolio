# org-mode stock market portfolio and calculations

This is an org file intended for use with the Emacs text editor.
It calculates an investment portfolio's latest value in GBP and ZAR.
I think tables in org-mode are quite unstable and are probably only intended for simple use and not even for moderately complex calculations.
There is a workflow that needs to be performed to make this file up to date:
1. Go to www.moneyweb.co.za choose "Data" at the top. Then choose "Click a company" to find the latest JSE stock prices.
2. Populate the "zaequity" table with the latest stock prices. Note: you will need to do a little mental conversion, converting the stock prices from moneyweb from South African Rands to South African cents. (x100)
3. Update the "zaequity" table by placing the cursor somewhere within it and then typing this key sequence C-u C-u C-c \*.
4. Similarly, for the Credo table, look up the prices of the Credo investments on Bloomberg and enter the latest market prices. Then, update this table too with C-u C-u C-c \*
5. Execute the support code that looks up the latest exchange rates. C-c C-c (with cursor placed somewhere on the source code_
6. Update the "fx" table: C-u C-u C-c \* (where the cursor is on it somewhere)
7. Finally, update the "assets" table to calculate the latest ZAR and GBP value of the investments.

Yes, this should all be automated! (Anybody know of a free api for accessing JSE stock values?)
