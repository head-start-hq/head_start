import { currentTimeZoneOffset } from '~/helpers/date_time';
import { observe } from '~/helpers/observers';

/**
 * Sets the current time zone offset in seconds to a hidden input field.
 */
observe<HTMLFormElement>('[data-js-detect-time-zone]', {
  connected(element) {
    const tzOffsetInput = element.querySelector<HTMLInputElement>('input[type="hidden"][data-js-time-zone-offset]');
    if (tzOffsetInput) {
      tzOffsetInput.value = String(currentTimeZoneOffset());
    }
  },
});
