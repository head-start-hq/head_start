/**
 * Returns Rails compatible current time zone offset in seconds.
 */
export function currentTimeZoneOffset() {
  return new Date().getTimezoneOffset() * 60 * -1;
}
