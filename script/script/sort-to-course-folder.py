#!/usr/bin/env python3
import argparse
import os


def parse_argument() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Sort files into course folders.")
    parser.add_argument(
        "course_code",
        help="The course code to sort files for."
        "You may also specify the type by including it in the course code by"
        "adding a .",
    )
    parser.add_argument(
        "--type",
        "-t",
        type=str,
        help="The type of files to be sorted."
        "They will be sorted into a subfolder if possible.",
    )
    parser.add_argument("files", nargs="+", help="The files to be sorted.")
    return parser.parse_args()


def find_course_folder(course_code: str) -> str:
    COURSE_FOLDER_PARENT_PARENT = os.path.expanduser("~/Documents/HKU/01-Study/")

    results = []

    for folder in os.listdir(COURSE_FOLDER_PARENT_PARENT):
        if not os.path.isdir(os.path.join(COURSE_FOLDER_PARENT_PARENT, folder)):
            continue
        for subfolder in os.listdir(os.path.join(COURSE_FOLDER_PARENT_PARENT, folder)):
            if not os.path.isdir(
                os.path.join(COURSE_FOLDER_PARENT_PARENT, folder, subfolder)
            ):
                continue
            if course_code in subfolder:
                results.append(
                    os.path.join(COURSE_FOLDER_PARENT_PARENT, folder, subfolder)
                )
    if not results:
        raise FileNotFoundError(f"Course folder for {course_code} not found.")
    if len(results) > 1:
        raise FileExistsError(
            f"Multiple course folders found for {course_code}: {results}"
        )
    return results[0]


def find_type_subfolder(course_folder: str, type_name: str) -> str:
    TYPE_ALIASES = [
        ["asm", "assignment", "homework", "hw"],
        ["lec", "lecture", "slides"],
        ["note", "notes"],
        ["proj", "project", "groupproject", "gp"],
        ["tutorial", "tutorials", "tut"],
        ["papers", "exam", "pastpaper", "paper", "pp"],
        ["quiz", "test", "qz", "quizzes"],
    ]
    if not type_name:
        return course_folder
    type_name = type_name.lower()
    if type_name in sum(TYPE_ALIASES, []):
        for alias_group in TYPE_ALIASES:
            if type_name in alias_group:
                for subfolder in os.listdir(course_folder):
                    if not os.path.isdir(os.path.join(course_folder, subfolder)):
                        continue
                    for alias in alias_group:
                        if alias in subfolder.lower():
                            return os.path.join(course_folder, subfolder)
    else:
        for subfolder in os.listdir(course_folder):
            if not os.path.isdir(os.path.join(course_folder, subfolder)):
                continue
            if type_name in subfolder.lower():
                return os.path.join(course_folder, subfolder)
    return course_folder


def find_target_folder(course_code_type: str) -> str:
    if "." in course_code_type:
        course_code, type_name = course_code_type.split(".", 1)
    else:
        course_code, type_name = course_code_type, None
    course_folder = find_course_folder(course_code)
    return find_type_subfolder(course_folder, type_name)


def main():
    args = parse_argument()
    if args.type:
        course_code_type = f"{args.course_code}.{args.type}"
    else:
        course_code_type = args.course_code
    try:
        target_folder = find_target_folder(course_code_type)
    except (FileNotFoundError, FileExistsError) as e:
        print(f"Error: {e}")
        return

    for file in args.files:
        if not os.path.isfile(file):
            print(f"Warning: {file} is not a valid file. Skipping.")
            continue
        try:
            os.rename(file, os.path.join(target_folder, os.path.basename(file)))
            print(f"Moved {file} to {target_folder}")
        except Exception as e:
            print(f"Error moving {file}: {e}")


if __name__ == "__main__":
    main()
