export class CommonConstant {
  // Full the width.
  static readonly FULL_WIDTH: string = '100%';

  // Full the height.
  static readonly FULL_HEIGHT: string = '100%';

}

/*
 * The refresh state enum.
 */
export const enum RefreshState {
  DropDown = 0,
  Release = 1,
  Refreshing = 2,
  Success = 3,
  Fail = 4
}