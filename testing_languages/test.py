from time import time


class App():
    def __init__(
        self,
        name: str,
    ) -> None:
        self.name = name
        print('App called {name} has been initialized'.format(
            name=self.name
        ))

    def run(self, life_length: int):
        """Some method"""
        print('Running application called {name}')
        time.sleep(life_length)
        print('Application has been closed')

        

