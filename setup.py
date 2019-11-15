from setuptools import setup, find_packages

setup(
    name="ASsc-RNA-seq",
    packages=find_packages(include=["ASsc-RNA-seq", "ASsc-RNA-seq.*"], exclude=["tests", "*.tests"]),
    zip_safe=False,
    tests_require=["coverage", "nose"],
    test_suite="nose.collector",
)
