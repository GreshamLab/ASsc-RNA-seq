from setuptools import setup, find_packages

setup(
    name="ASscRNAseq",
    packages=find_packages(include=["ASscRNAseq", "ASscRNAseq.*"], exclude=["tests", "*.tests"]),
    zip_safe=False,
    tests_require=["coverage", "nose"],
    test_suite="nose.collector",
)
