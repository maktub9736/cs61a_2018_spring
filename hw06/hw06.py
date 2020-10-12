# Object Oriented Programming

class Fib():
    """A Fibonacci number.

    >>> start = Fib()
    >>> start
    0
    >>> start.next()
    1
    >>> start.next().next()
    1
    >>> start.next().next().next()
    2
    >>> start.next().next().next().next()
    3
    >>> start.next().next().next().next().next()
    5
    >>> start.next().next().next().next().next().next()
    8
    >>> start.next().next().next().next().next().next() # Ensure start isn't changed
    8
    """
    value = 0
    last = None

    def __init__(self, value=0, last=None):
        self.value = value
        self.last = last

    def next(self):
        if isinstance(self.last, Fib):
            next_fib = Fib(self.last.value + self.value)
        else:
            next_fib = Fib(1)
        next_fib.last = self
        return next_fib

    def __repr__(self):
        return str(self.value)

class VendingMachine:
    """A vending machine that vends some product for some price.

    >>> v = VendingMachine('candy', 10)
    >>> v.vend()
    'Machine is out of stock.'
    >>> v.deposit(15)
    'Machine is out of stock. Here is your $15.'
    >>> v.restock(2)
    'Current candy stock: 2'
    >>> v.vend()
    'You must deposit $10 more.'
    >>> v.deposit(7)
    'Current balance: $7'
    >>> v.vend()
    'You must deposit $3 more.'
    >>> v.deposit(5)
    'Current balance: $12'
    >>> v.vend()
    'Here is your candy and $2 change.'
    >>> v.deposit(10)
    'Current balance: $10'
    >>> v.vend()
    'Here is your candy.'
    >>> v.deposit(15)
    'Machine is out of stock. Here is your $15.'

    >>> w = VendingMachine('soda', 2)
    >>> w.restock(3)
    'Current soda stock: 3'
    >>> w.restock(3)
    'Current soda stock: 6'
    >>> w.deposit(2)
    'Current balance: $2'
    >>> w.vend()
    'Here is your soda.'
    """
    "*** YOUR CODE HERE ***"
    name = None
    price = None
    stock = 0
    balance = 0

    def __init__(self, name, price):
        self.name = name
        self.price = price

    def deposit(self, amount):
        if not self.stock:
            return 'Machine is out of stock. Here is your ${}.'.format(amount)
        else:
            self.balance += amount
            return 'Current balance: ${}'.format(self.balance)

    def vend(self):
        if self.stock:
            if self.balance < self.price:
                return 'You must deposit ${} more.'.format(self.price - self.balance)
            elif self.balance == self.price:
                self.stock -= 1
                return 'Here is your {}.'.format(self.name)
            else:
                change = self.balance - self.price
                self.balance = 0
                self.stock -= 1
                return 'Here is your {} and ${} change.'.format(self.name, change)
        else:
            return 'Machine is out of stock.'

    def restock(self, number):
        self.stock += number
        return 'Current {} stock: {}'.format(self.name, self.stock)
