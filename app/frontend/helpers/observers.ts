import { ElementObserver, ElementObserverDelegate } from '@ambiki/impulse';

type Options<T> = {
  connected?: (element: T) => void;
  disconnected?: (element: T) => void;
};

/**
 * Observe elements matching a selector.
 *
 * @param selector The selector to match elements.
 * @param options Options for the observer.
 * @param options.connected A callback that is called when an element is connected.
 * @param options.disconnected A callback that is called when an element is disconnected.
 *
 * @example
 * observe('[data-js-element]', {
 *   connected(element) {
 *     console.log('Element connected:', element);
 *   },
 *   disconnected(element) {
 *     console.log('Element disconnected:', element);
 *   },
 * });
 */
export function observe<T extends Element = Element>(selector: string, options: Options<T> = {}) {
  class Delegate implements ElementObserverDelegate {
    elementConnected(element: Element) {
      options.connected?.(element as T);
    }

    elementDisconnected(element: Element) {
      options.disconnected?.(element as T);
    }

    getMatchingElements(element: Element) {
      const elements = Array.from(element.querySelectorAll<T>(selector));
      if (element.hasAttribute(selector)) {
        elements.unshift(element as T);
      }
      return elements;
    }
  }

  const delegate = new Delegate();
  const observer = new ElementObserver(document.documentElement, delegate, { attributeFilter: [selector] });
  observer.start();
}
