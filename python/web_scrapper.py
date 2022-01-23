#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# File Name: web_scrapper.py

__project__ = "Themer.lua"
__title__ = "Markdown Web Scrapper - Themer"
__version__ = "0.1.0"

import json
import os
import pprint
from collections import OrderedDict

import requests
from bs4 import BeautifulSoup


class Scrapping:
    """Scrapping class.

    Attributes
    ----------
    container: OrderedDict
        OrderedDict of color schemes
    print : bool
        print color schemes from json file
    """

    def __init__(self):
        self.container = OrderedDict()
        self.print = False

    def dict_to_json(self) -> None:
        """Convert OrderedDict to json

        Parameters
        ----------
        container : OrderedDict
            OrderedDict to convert to json

        Returns
        -------
        None
        """

        if not os.path.exists("json"):
            os.makedirs("json")
        with open("json/color_schemes.json", "w") as f:
            json.dump(self.container, f, indent=4)

    def json_to_dict(self) -> None:
        """convert json to ordered dict if required

        Parameters
        ----------
        self: Scrapping
            Scrapping object

        """
        with open("json/color_schemes.json", "r") as f:
            data = json.load(f)
            self.container = data

    def extract_color_schemes(self, url: str) -> None:
        """Extract color schemes from a given url

        Parameters
        ----------
        url: str
            url to extract color schemes from


        Returns
        -------
        container : OrderedDict
            OrderedDict of color schemes
        """

        soup = BeautifulSoup(requests.get(url).text, "html.parser")

        for i in range(33, 37):
            """
            ul range is 33 to 37 : this could change in the future

            for each ul you have a li with a link - loop over each ul and extract that
            """
            color_scheme_details = soup.find_all("ul")[i]
            for info in color_scheme_details.find_all("li"):
                scheme_url = info.find("a").get("href")
                scheme_name = info.find("a").text
                self.container[scheme_name] = scheme_url

    def print_from_json(self) -> None:
        """Print color schemes from json file"""
        with open("json/color_schemes.json", "r") as f:
            data = json.load(f)
            pprint.pprint(data)

    def main(self) -> None:
        """Main function"""
        self.extract_color_schemes(
            "https://github.com/rockerBOO/awesome-neovim/blob/main/README.md"
        )
        self.dict_to_json()

        if self.print():
            self.print_from_json()


if __name__ == "__main__":
    Scrapping().main()
