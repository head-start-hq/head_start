import { ElementObserver } from '@ambiki/impulse';

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
  class Delegate {
    elementConnected(element: Element) {
      const elements = this.getMatchingElements(element);
      for (const ele of elements) {
        options.connected?.(ele);
      }
    }

    elementDisconnected(element: Element) {
      const elements = this.getMatchingElements(element);
      for (const ele of elements) {
        options.disconnected?.(ele);
      }
    }

    private getMatchingElements(element: Element) {
      const elements = Array.from(element.querySelectorAll<T>(selector));
      if (element.hasAttribute(selector)) {
        elements.unshift(element as T);
      }
      return elements;
    }
  }

  const owner = document.documentElement;
  const delegate = new Delegate();
  const observer = new ElementObserver(owner, delegate, { attributeFilter: [selector] });
  if (owner.isConnected) {
    delegate.elementConnected(document.documentElement);
  }

  observer.start();
}
