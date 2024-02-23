interface args {
  original: string;
  shorten: string;
}

export class LinkModel {
  shorten: string;
  original: string;

  constructor({ original, shorten }: args) {
    this.original = original;
    this.shorten = shorten;
  }
}
